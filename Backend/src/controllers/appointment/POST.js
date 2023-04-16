const Appointment = require('../../models/appointment');
const { catchAsync } = require('../../utils/catchAsync');

// Create New Appointment

exports.createAppointment = catchAsync(async (req, res, next) => {
  const newAppointment = await Appointment.create({
    user: req.userId,
    ...req.body,
  });

  // * Response

  res.status(201).json({
    status: 'success',
    data: { newAppointment },
  });
});
