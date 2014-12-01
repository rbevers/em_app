#= require_self
#= require_tree ./em/services
#= require_tree ./em/controllers
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
  .when('/', {
    templateUrl: 'index.html',
    controller: 'HomeController'
  })
  .otherwise({
    redirectTo: '/'
  })
])

window.controllers = angular.module('controllers', ['ngResource'])
