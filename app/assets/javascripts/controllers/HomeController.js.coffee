window.controllers.controller('HomeController', ['$scope', '$rootScope', '$location', '$http',
  ($scope, $rootScope, $location, $http) ->
    if not $rootScope.access or not $rootScope.access.token
      return $location.path('/log_in')

    $http.get('/api/v1/account', {
      headers: {
        'Authorization': 'Bearer ' + $rootScope.access.token
      }
    }).success((user)->
      $scope.firstName = user.first_name
      $scope.lastName = user.last_name
      $scope.name = $scope.firstName
    )
])
