class ResponseError extends Error {
  // Define a constructor method that takes two parameters: message and status
  constructor(message, status) {
    // Call the constructor of the parent class (Error) with the message parameter
    super(message);

    // Set the status property of the new object to the value of the status parameter
    this.status = status;

    // Set the isOperational property of the new object to true
    this.isOperational = true;

    // Use the Error.captureStackTrace method to capture the stack trace of the error
    Error.captureStackTrace(this, this.constructor);
  }
}

module.exports = ResponseError;
