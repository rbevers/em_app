window.controllers.controller('LoginController', ['$scope', '$rootScope', '$http', '$location',
  ($scope, $rootScope, $http, $location) ->
    $scope.email = null
    $scope.password = null
    
    $scope.login = () ->
      if !$scope.email
        $scope.errorMessage = 'Email is required.'
        return
      if !$scope.password
        $scope.errorMessage = 'Password is required.'
        return
      $http.post('/oauth/token', {
        grant_type: 'password',
        username: $scope.email,
        password: $scope.password
      }).success((data)->
        $rootScope.access = {} if not $rootScope.access
        $rootScope.access.token = data.access_token
        $rootScope.access.type = data.token_type
        $rootScope.access.expiry = Date.now() + (data.expires_in * 1000)
        $location.path('/')
      )
])
