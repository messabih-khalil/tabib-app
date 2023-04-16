const Speciality = require('../../models/speciality');
const { catchAsync } = require('../../utils/catchAsync');

// Update Speciality

exports.updateSpeciality = catchAsync(async (req, res, next) => {
  const speciality = await Speciality.findByIdAndUpdate(
    req.params.id,
    req.body,
    { new: true }
  );

  // * Response
  res.status(200).json({
    status: 'success',
    data: { speciality },
  });
});
