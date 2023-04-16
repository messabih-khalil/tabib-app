const express = require('express');
const { sigin, signup } = require('../controllers/users/POST');
const { updateMyPassword } = require('../controllers/users/PUT');
const { deleteMyAccount } = require('../controllers/users/DELETE');
const {
  isAuthenticated,
} = require('../middlewares/isAuthenticated.middleware');
const router = express.Router();

// Authentication routes

// * SIGNUP ROUTE
router.route('/auth/signup').post(signup);
// * SIGNIN ROUTE
router.route('/auth/signin').post(sigin);

router.use(isAuthenticated); // The Routes under this middleware the user should be authenticated

// User Account Routes

// * UPDATE PASSWORD
router.route('/users/me/updatePassword').put(updateMyPassword);

// * DELETE ACCOUNT
router.route('/users/me').delete(deleteMyAccount);

// * MERGE PROFILE ROUTES

router.use('/users/profiles/', require('./profile.routes'));

module.exports = router;
