const DoctorAppointment = require('../../models/doctor_appointmet');
const { catchAsync } = require('../../utils/catchAsync');


exports.updateDoctorAppointment = catchAsync(async (req, res, next) => {
  const appointment = await DoctorAppointment.findByIdAndUpdate(
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
