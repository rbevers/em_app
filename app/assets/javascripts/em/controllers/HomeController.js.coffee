window.controllers.controller('HomeController', ['$scope', '$rootScope', '$location',
  ($scope, $rootScope, $location) ->
    $location.path('/log_in') if not $rootScope.access or not $rootScope.access.token
])
