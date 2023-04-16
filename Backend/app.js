const express = require('express');
const ResponseError = require('./src/utils/responseError');
const { errorHandler } = require('./src/middlewares/errorHandler.middleware');

// Init app

const app = express();

// Add middleware to parse incoming JSON data
app.use(express.json());

// Routes
app.use('/api/v1/specialities', require('./src/routes/speciality.routes'));
app.use('/api/v1/appointments', require('./src/routes/appointment.routes'));
app.use('/api/v1/doctor/appointments', require('./src/routes/doctorAppointment.routes'));
app.use('/api/v1/', require('./src/routes/user.routes'));

// Hnadle Unhadled Route

app.all('*', (req, res, next) => {
  next(new ResponseError(`Not exist : ${req.originalUrl}`, 404));
});

// Operational Error handler

app.use(errorHandler);

// Export app

module.exports = app;
