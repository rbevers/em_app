#= require_self
#= require_tree ./controllers
window.emApp = angular.module('emApp', [
  'templates',
  'ngRoute',
  'controllers'
])

window.emApp.config(['$routeProvider', ($routeProvider) ->
  $routeProvider
  .when('/log_in', {
    templateUrl: 'login.html',
    controller: 'LoginController'
  })
  .when('/log_out', {
    template: '',
    controller: 'LogoutController'
  })
  .when('/', {
    templateUrl: 'index.html',
    controller: 'HomeController'
  })
  .otherwise({
    redirectTo: '/'
  })
])

window.controllers = angular.module('controllers', ['ngResource'])
