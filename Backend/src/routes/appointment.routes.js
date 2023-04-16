const express = require('express');
const { getMyAppointment } = require('../controllers/appointment/GET');
const { createAppointment } = require('../controllers/appointment/POST');
const { updateAppointment } = require('../controllers/appointment/PUT');
const { deleteAppointment } = require('../controllers/appointment/DELETE');
const {
  isAuthenticated,
} = require('../middlewares/isAuthenticated.middleware');
const {
  restrictTo,
} = require('../middlewares/authorization/restrictTo.middleware');
const {
  isPatient,
} = require('../middlewares/authorization/isPatient.middleware');

//
const router = express.Router();

router.use(isAuthenticated); // The Routes under this middleware the user should be authenticated

// Speciality route

// * CREATE APPOINTMENT
router.route('/').get(getMyAppointment).post(createAppointment);

// * UPDATE DELETE APPOINTMENT
router
  .route('/:id')
  .put(restrictTo('user'), isPatient, updateAppointment)
  .delete(deleteAppointment);

module.exports = router;
