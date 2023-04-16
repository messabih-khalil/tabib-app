const express = require('express');
const ResponseError = require('./src/utils/responseError');
const { errorHandler } = require('./src/middlewares/errorHandler.middleware');

// Init app

const app = express();

// Add middleware to parse incoming JSON data
app.use(express.json());

// Routes


// Hnadle Unhadled Route

app.all('*', (req, res, next) => {
  next(new ResponseError(`Not exist : ${req.originalUrl}`, 404));
});

// Operational Error handler

app.use(errorHandler);

// Export app

module.exports = app;
