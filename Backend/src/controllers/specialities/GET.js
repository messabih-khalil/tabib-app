const Speciality = require('../../models/speciality');
const { catchAsync } = require('../../utils/catchAsync');

// Get All Specialities

exports.getSpecialities = catchAsync(async (req, res, next) => {
  const specialities = await Speciality.find();

  // * Response
  res.status(200).json({
    success: true,
    data: { specialities },
  });
});
