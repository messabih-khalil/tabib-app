const mongoose = require('mongoose');

// Speciality Schema

const doctorAppointmentSchema = mongoose.Schema(
  {
    doctor: {
      type: mongoose.Schema.Types.ObjectId,
      ref: 'User',
    },
    appointment: {
      type: mongoose.Schema.Types.ObjectId,
      ref: 'Appointment',
    },
    user: {
      type: mongoose.Schema.Types.ObjectId,
      ref: 'User',
    },
    price: {
      type: Number,
      default: 0,
    },
    status: {
      type: Boolean,
      default: false,
    },
  },
  {
    toJSON: { virtuals: true },
    toObject: { virtuals: true },
  },
  { timestamps: { updatedAt: true } }
);

doctorAppointmentSchema.virtual('userProfile', {
  ref: 'Profile',
  localField: 'user',
  foreignField: 'user',
  justOne: true,
  populate: {
    path: 'user',
    model: 'User',
  },
});
const DoctorAppointment = mongoose.model(
  'DoctorAppointment',
  doctorAppointmentSchema
);

module.exports = DoctorAppointment;
