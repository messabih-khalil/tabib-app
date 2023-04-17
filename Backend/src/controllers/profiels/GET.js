const Profile = require('../../models/profile');
const { catchAsync } = require('../../utils/catchAsync');

// Get My Profile

exports.getMyProfile = catchAsync(async (req, res, next) => {
  let profile = await Profile.find({ user: req.userId }).populate({
    path: 'user',
    select: '-__v -password -role',
  });

  // * Response
  res.status(200).json({
    success: true,
    data: { profile },
  });
});

// Get Doctors Profile
// Notice that :: we can return all doctors profiles or filter by username , speciality , location

exports.getDoctorsProfile = catchAsync(async (req, res, next) => {
  let doctorsProfiles = await Profile.find(req.query).populate({
    path: 'user',
    match: { role: 'doctor' },
    select: '-__v -password -role',
  });

  // * Remove Nullable document

  doctorsProfiles = doctorsProfiles.filter(worker => worker.user);

  // * Response

  res.status(200).json({
    success: true,
    data: { doctorsProfiles },
  });
});
