const Appointment = require('../../models/appointment');
const { catchAsync } = require('../../utils/catchAsync');

// Create New Appointment

exports.updateAppointment = catchAsync(async (req, res, next) => {
  const appointment = await Appointment.findByIdAndUpdate(
    req.params.id,
    req.body,
    { new: true }
  );

  // * Response

  res.status(201).json({
    status: 'success',
    data: { appointment },
  });
});
