
/**
 * node-angular
 */

var app = angular.module('app', [], function($routeProvider) {

  $routeProvider.when('/welcome', {
    templateUrl   : 'partials/welcome.html',
    controller : WelcomeController  
  });
  $routeProvider.otherwise({ 
    redirectTo : '/welcome'
  });

});

app.config(function($locationProvider) {  
  $locationProvider.hashPrefix('');
  $locationProvider.html5Mode(true);
});

/* EOF */
