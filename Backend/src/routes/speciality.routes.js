const express = require('express');
const { createSpeciality } = require('../controllers/specialities/POST');
const { getSpecialities } = require('../controllers/specialities/GET');
const { updateSpeciality } = require('../controllers/specialities/PUT');
const { deleteSpeciality } = require('../controllers/specialities/DELETE');

//
const router = express.Router();

// Speciality route

// * CREATE SPECIALITY
router.route('/').get(getSpecialities).post(createSpeciality);

// * UPDATE DELETE SPECILITY
router.route('/:id').put(updateSpeciality).delete(deleteSpeciality);

module.exports = router;
