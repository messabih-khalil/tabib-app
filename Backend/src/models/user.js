// Imports
const mongoose = require('mongoose');
const bcrypt = require('bcryptjs');
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


// * Create User Model from User Schema

const User = mongoose.model('User', userSchema);

module.exports = User;
