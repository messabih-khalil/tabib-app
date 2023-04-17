const Appointment = require('../../models/appointment');
const { catchAsync } = require('../../utils/catchAsync');

// Create New Appointment

exports.deleteAppointment = catchAsync(async (req, res, next) => {
  await Appointment.findOneAndDelete(req.params.id);

  // * Response

  res.status(204).json({
    success: true,
  });
});
