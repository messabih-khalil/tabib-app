const Speciality = require('../../models/speciality');
const { catchAsync } = require('../../utils/catchAsync');

// Delete Speciality

exports.deleteSpeciality = catchAsync(async (req, res, next) => {
  await Speciality.findOneAndDelete(req.params.id);

  res.status(204).json({
    status: 'success',
  });
});
