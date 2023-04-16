const Appointment = require('../../models/appointment');
const { catchAsync } = require('../../utils/catchAsync');

// Get My Appointment

exports.getMyAppointment = catchAsync(async (req, res, next) => {
  const appointments = await Appointment.find({ user: req.userId })
    .populate({
      path: 'doctor',
      select: '-password -role',
    })
    .populate('doctorProfile');

  // * Response

  res.status(200).json({
    status: 'success',
    data: { appointments },
  });
});
