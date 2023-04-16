// Catch Async Errors
exports.catchAsync = fn => (req, res, next) => fn(req, res, next).catch(next);
