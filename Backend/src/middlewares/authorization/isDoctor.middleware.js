const DoctorAppointment = require('../../models/doctor_appointmet');
const User = require('../../models/user');
const { catchAsync } = require('../../utils/catchAsync');
const ResponseError = require('../../utils/responseError');

// Check if the requested user is the author of the document

exports.isDoctor = catchAsync(async (req, res, next) => {
  const doc = await DoctorAppointment.findById(req.params.id);
  if (doc.doctor != req.userId) {
    return new ResponseError('You Are Not The Author of This', 403);
  }
  next();
});
