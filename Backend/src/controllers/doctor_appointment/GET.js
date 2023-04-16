const DoctorAppointment = require('../../models/doctor_appointmet');
const { catchAsync } = require('../../utils/catchAsync');

// Get All Doctor Appointments

exports.getDoctorAppointments = catchAsync(async (req, res, next) => {
  const appointments = await DoctorAppointment.find({
    doctor: req.userId,
  })
    .populate({
      path: 'appointment',
      select: '-user -doctor -__v -id',
    })
    .populate({
      path: 'user',
      select: '-password -role',
    })
    .populate('userProfile')
    .select('-doctor');

  // * Response

  res.status(200).json({
    status: 'success',
    data: { appointments },
  });
});
