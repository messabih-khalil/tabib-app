const ResponseError = require('../middlewares/errorHandler.middleware');

// Send Error To development
const sendErrorDev = (err, res) => {
  res.status(err.status || 500).json({
    success: false,
    message: err.message,
    error: err,
    stack: err.stack,
  });
};

// Send Error to production
const sendErrorProd = (err, res) => {
  if (err.isOperational) {
    res.status(err.status).json({
      success: false,
      message: err.message,
    });
  } else {
    // Log Error into Hosting server
    console.error('Error', err);

    // send Unkown Error to production

    res.status(500).json({
      success: false,
      // message: 'Somthing went very Worng!',
    });
  }
};

// Handle jwt error : incorrect token
const handleJWTError = () =>
  new ResponseError('Invalid Token , Please log in again!', 401);

// Handle Expired jwt token

const handleExpiredToken = () =>
  new ResponseError('Your Token has expired , Please log in again!', 401);

exports.errorHandler = (err, req, res, next) => {
  if (process.env.NODE_ENV === 'development') {
    sendErrorDev(err, res);
  }
  // Send Error details to client
  if (process.env.NODE_ENV === 'production') {
    if (err.name === 'JsonWebTokenError') err = handleJWTError();
    if (err.name === 'TokenExpiredError') err = handleExpiredToken();
    sendErrorProd(err, res);
  }
};
