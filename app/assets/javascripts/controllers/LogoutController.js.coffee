window.controllers.controller('LogoutController', ['$scope', '$rootScope', '$location',
  ($scope, $rootScope, $location) ->
    $rootScope.access = null
    $location.path('/log_in')
])
