const User = require('../../models/user');
const { catchAsync } = require('../../utils/catchAsync');

// Delete My Account
exports.deleteMyAccount = catchAsync(async (req, res, next) => {
  // * Get User and deleted
  await User.findByIdAndDelete(req.userId);

  res.status(204).json({
    success: true,
    message: 'Account deleted',
  });
});
