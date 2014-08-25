/**
 * UserController
 *
 * @description :: Server-side logic for managing users
 * @help        :: See http://links.sailsjs.org/docs/controllers
 */

module.exports = {

  'new': function (req, res) {
    res.view();
  },

  create: function (req, res, next) {
    // Create a user with the params sent from
    // the sign-up form --> new.ejs
    User.create( req.params.all(), function userCreated (err, user) {
      // If there's an error
      if (err) return next(err);

      // After successfully creating the user
      // redirect to the show action
      res.json(user);
    });
  }
};

