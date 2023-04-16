const Speciality = require('../../models/speciality');
const { catchAsync } = require('../../utils/catchAsync');

// Create New Speciality
exports.createSpeciality = catchAsync(async (req, res, next) => {
  const newSpeciality = await Speciality.create({
    title: req.body.title,
    image: req.body.image,
  });

  // * Response

  res.status(200).json({
    status: 'succsess',
    data: { newSpeciality },
  });
});
