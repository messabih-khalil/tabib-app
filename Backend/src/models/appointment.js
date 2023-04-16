const mongoose = require('mongoose');
const DoctorAppointment = require('./doctor_appointmet');

// Speciality Schema

const appointmentSchema = mongoose.Schema(
  {
    user: {
      type: mongoose.Schema.Types.ObjectId,
      ref: 'User',
    },
    doctor: {
      type: mongoose.Schema.Types.ObjectId,
      ref: 'User',
    },
    date: Date,
    status: {
      type: Boolean,
      default: false,
    },
  },
  {
    toJSON: { virtuals: true },
    toObject: { virtuals: true },
  },
  { timestamps: { createdAt: true } }
);

// Define virtual field for doctor profile
appointmentSchema.virtual('doctorProfile', {
  ref: 'Profile',
  localField: 'doctor',
  foreignField: 'user',
  justOne: true,
});

// Auto Create Doctor Appointment when a new Appointment created
appointmentSchema.post('save', async function (doc) {
  try {
    // * Create a new doctorAppointmentSchema instance
    const doctorAppointment = new DoctorAppointment({
      doctor: doc.doctor,
      appointment: doc._id,
      user : doc.user, 
      price: 100,
    });

    // * Save the new doctorAppointmentSchema instance
    await doctorAppointment.save();
  } catch (error) {
    console.log(error);
  }
});

const Appointment = mongoose.model('Appointment', appointmentSchema);

module.exports = Appointment;
