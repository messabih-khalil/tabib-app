const express = require('express');
const {
  getDoctorAppointments,
} = require('../controllers/doctor_appointment/GET');
const {
  isDoctor,
} = require('../middlewares/authorization/isDoctor.middleware');
const {
  updateDoctorAppointment,
} = require('../controllers/doctor_appointment/PUT');
const {
  deleteDoctorAppointment,
} = require('../controllers/doctor_appointment/DELETE');
const { isAuthenticated } = require('../middlewares/isAuthenticated.middleware');
const { restrictTo } = require('../middlewares/authorization/restrictTo.middleware');


// 

const router = express.Router();

router.use(isAuthenticated); // The Routes under this middleware the user should be authenticated

// Speciality route

// * CREATE APPOINTMENT
router.route('/').get(restrictTo('doctor'), getDoctorAppointments);

// * UPDATE DELETE APPOINTMENT
router
  .route('/:id')
  .put(restrictTo('doctor'), isDoctor, updateDoctorAppointment)
  .delete(restrictTo('doctor'), isDoctor , deleteDoctorAppointment);

module.exports = router;
