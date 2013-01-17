// This is a module for cloud persistance in mongolab - https://mongolab.com
angular.module('mongolab', ['ngResource']).factory('Project', function($resource) {
  
  var Project = $resource('https://api.mongolab.com/api/1/databases' +
    '/angular-project/collections/projects/:id',
    { apiKey: '50c75b67e4b067a576ea9cdf' }, {
      update: { method: 'PUT' }
    }
  );

  Project.prototype.update = function(cb) {
    return Project.update({id: this._id.$oid}, angular.extend({}, this, {_id:undefined}), cb);
  };

  Project.prototype.destroy = function(cb) {
    return Project.remove({id: this._id.$oid}, cb);
  };

  return Project;
});
