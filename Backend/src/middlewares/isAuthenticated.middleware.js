const JWT = require('jsonwebtoken');
const { catchAsync } = require('../utils/catchAsync');
const ResponseError = require('../utils/responseError');
const util = require('util');
const User = require('../models/user');

exports.isAuthenticated = catchAsync(async (req, res, next) => {
  // * 1) Get the token
  let token;

  if (
    req.headers.authorization &&
    req.headers.authorization.startsWith('Bearer')
  ) {
    token = req.headers.authorization.split(' ')[1];
  }

  if (!token) {
    return next(
      new ResponseError('You are not logged in !! PLease Login', 401)
    );
  }
  // * 2) Validate token
  const decodeToken = await util.promisify(JWT.verify)(
    token,
    process.env.JWT_SECERT_KEY
  );

  // * 3) Check if user still exists and not removed his account
  const user = await User.findOne({ _id: decodeToken.id });

  if (!user) {
    return next(new ResponseError('Your Account In No Longer Exist'));
  }

  // * 4) put user id in the request for grant access usage

  req.userId = decodeToken.id;
  next();
});
