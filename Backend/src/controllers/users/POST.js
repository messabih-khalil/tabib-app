// Imports
const User = require('../../models/user');
const { catchAsync } = require('../../utils/catchAsync');
const JWT = require('jsonwebtoken');
const ResponseError = require('../../utils/responseError');
// Sign up User
exports.signup = catchAsync(async (req, res, next) => {
  //  * Create new user
  const newUser = await User.create({
    phoneNumber: req.body['phoneNumber'],
    password: req.body['password'],
    passwordConfirm: req.body['passwordConfirm'],
    role: req.body['role'],
  });

  // * Generate Token
  const token = JWT.sign({ id: newUser._id }, process.env.JWT_SECERT_KEY, {
    expiresIn: process.env.JWT_EXPIRES_IN,
  });

  // * Response with jwt token
  res.status(201).json({
    status: 'success',
    token: token,
  });
});

// Login User
exports.sigin = catchAsync(async (req, res, next) => {
  // * Get Phone number and password from request body
  const { phoneNumber, password } = req.body;
  // * 1) Check if phone number and password is exist
  if (!phoneNumber || !password) {
    return next(
      new ResponseError('Please Enter Password and phone number', 400)
    );
  }
  // * 2) Check if user exist and password is correect
  const user = await User.findOne({ phoneNumber });

  if (!user) {
    return next(new ResponseError('Please Enter valid phone number', 401));
  }

  const correctPassword = await user.correctPassword(password, user.password);

  if (!correctPassword) {
    return next(new ResponseError('Your Entered Password Is Incorrect', 401));
  }

  // * 3) When everithing okey , send token to client

  const token = JWT.sign({ id: user._id }, process.env.JWT_SECERT_KEY, {
    expiresIn: process.env.JWT_EXPIRES_IN,
  });

  // * 3) -1 Put user id in request for give grant access to protected route

  res.status(200).json({
    status: 'Success',
    token: token,
  });
});
