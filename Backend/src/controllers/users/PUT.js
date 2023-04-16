const User = require('../../models/user');
const { catchAsync } = require('../../utils/catchAsync');
const ResponseError = require('../../utils/responseError');
const JWT = require('jsonwebtoken');

// Update Password

exports.updateMyPassword = catchAsync(async (req, res, next) => {
  const newPassword = req.body.newPassword;

  // * Get User

  const user = await User.findById(req.userId);

  // * check if current password send with request is correct

  if (!(await user.correctPassword(req.body.currentPassword, user.password))) {
    return next(new ResponseError('Your Current Password Is Incorect', 401));
  }

  // * Validate New password and Set The New Password
  user.password = newPassword;
  user.passwordConfirm = newPassword;
  await user.save();

  // * Regenerate Token , Log user in
  const token = JWT.sign({ id: user._id }, process.env.JWT_SECERT_KEY, {
    expiresIn: process.env.JWT_EXPIRES_IN,
  });

  res.status(200).json({
    status: 'success',
    tokne: token,
  });
});
