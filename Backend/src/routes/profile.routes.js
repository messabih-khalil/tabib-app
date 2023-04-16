const express = require('express');
const {
  getMyProfile,
  getDoctorsProfile,
} = require('../controllers/profiels/GET');
const { updateMyProfile } = require('../controllers/profiels/PUT');

//

const router = express.Router();

// Profile Routes

// * GET AND UPDATE  PROFILES

router.route('/doctors').get(getDoctorsProfile);
router.route('/me').get(getMyProfile).put(updateMyProfile);

// export route

module.exports = router;
