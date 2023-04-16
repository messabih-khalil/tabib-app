const mongoose = require('mongoose');

// User Profile Schema

const profileSchema = mongoose.Schema({
  user: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User',
  },
  username: {
    type: String,
  },
  image: {
    type: String,
    default:
      'https://t4.ftcdn.net/jpg/03/46/93/61/360_F_346936114_RaxE6OQogebgAWTalE1myseY1Hbb5qPM.jpg',
  },
  bio: String,
  speciality: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'Speciality',
    default: undefined,
  },
  location: {
    type: String,
  },
});

// User Profile Model

const Profile = mongoose.model('Profile', profileSchema);

module.exports = Profile;
