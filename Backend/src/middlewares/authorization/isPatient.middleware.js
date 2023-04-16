const Appointment = require('../../models/appointment');
const { catchAsync } = require('../../utils/catchAsync');
const ResponseError = require('../../utils/responseError');

// Check if the requested user is the author of the document

exports.isPatient = catchAsync(async (req, res, next) => {
  const doc = await Appointment.findOne({ _id: req.params.id });
  if (doc.user != req.userId) {
    return new ResponseError('You Are Not The Author of This', 403);
  }
  next();
});
