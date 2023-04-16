const mongoose = require('mongoose');

// Speciality Schema

const specialitySchema = mongoose.Schema({
  title: {
    type: String,
    required: [true, 'Please Provide Speciality Name'],
  },
  image: {
    type: String,
    required: [true, 'Please Provide Speciality Image'],
  },
});

// User Profile Model

const Speciality = mongoose.model('Speciality', specialitySchema);

module.exports = Speciality;
