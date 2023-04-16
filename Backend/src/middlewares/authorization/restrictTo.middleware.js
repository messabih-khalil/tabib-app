const User = require('../../models/user');
const ResponseError = require('../../utils/responseError');

exports.restrictTo =
  (...roles) =>
  async (req, res, next) => {
    // Get Authentiacted User To Check If He Has the access

    const user = await User.findById(req.userId);
    if (!roles.includes(user.role)) {
      return next(
        new ResponseError(
          'You Are Not Have The Permission To Preform This Action',
          403
        )
      );
    }

    next();
  };
