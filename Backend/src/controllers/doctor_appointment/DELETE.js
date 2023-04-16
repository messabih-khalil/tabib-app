const DoctorAppointment = require('../../models/doctor_appointmet');
const { catchAsync } = require('../../utils/catchAsync');

// Create New Appointment

exports.deleteDoctorAppointment = catchAsync(async (req, res, next) => {
  await DoctorAppointment.findOneAndDelete(req.params.id);

  // * Response

  res.status(204).json({
    status: 'success',
  });
});
