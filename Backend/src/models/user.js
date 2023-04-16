// Imports
const mongoose = require('mongoose');
const bcrypt = require('bcryptjs');
const { catchAsync } = require('../utils/catchAsync');
const Profile = require('./profile');
// Create User Schema

const userSchema = mongoose.Schema({
  phoneNumber: {
    type: String,
    required: [true, 'Please Provide A Phone Number'],
    unique: true,
  },
  password: {
    type: String,
    required: [true, 'Please Provide A Password'],
    minLength: 8,
  },

  passwordConfirm: {
    type: String,
    required: [true, 'Please Confirm Your Password'],
    validate: {
      validator: function (el) {
        return el === this.password;
      },
      message: 'Passowrd are not the same!',
    },
  },

  role: {
    type: String,
    enum: ['user', 'doctor', 'admin'],
    default: 'user',
  },
});

// * Validate Password And Encrypted Before Save
userSchema.pre('save', async function (next) {
  // * 1) Check if the Password is not changed
  if (!this.isModified('password')) return next();
  // * 2) Hashing the password
  this.password = await bcrypt.hash(this.password, 12);

  // * 3) Put Confirm password to undifiend to ignore it from save in db
  this.passwordConfirm = undefined;
});

// * Add methode to compare the hashed password with the password from request

userSchema.methods.correctPassword = async function (
  requestPassword,
  userPassword
) {
  return await bcrypt.compare(requestPassword, userPassword);
};



// Create User Account when a new user is registered

userSchema.pre('save', async function (next) {
  if (!this.isNew) {
    // * Don't create a profile if the user already exists
    return next();
  }

  try {
    // * Create a new profile for the user
    const profile = new Profile({ user: this._id });
    await profile.save();

    // * Associate the new profile with the user
    this.profile = profile._id;

    return next();
  } catch (error) {
    return next(error);
  }
});

// * Create User Model from User Schema

const User = mongoose.model('User', userSchema);

module.exports = User;
