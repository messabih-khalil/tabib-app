const Profile = require('../../models/profile');
const { catchAsync } = require('../../utils/catchAsync');

// Update User Profile Information
exports.updateMyProfile = catchAsync(async (req, res, next) => {
  // * Get Profiel By Id And Update
  const profile = await Profile.updateOne({ user: req.userId }, req.body, {
    new: true,
  });

  res.status(200).json({
    status: 'success',
  });
});
