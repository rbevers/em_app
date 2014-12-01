window.controllers.controller('LoginController', ['$scope', '$rootScope', '$http',
  ($scope, $rootScope, $http) ->
    $scope.email = null
    $scope.password = null
    
    $scope.login = () ->
      if !$scope.email
        $scope.errorMessage = 'Email is required.'
        return
      if !$scope.password
        $scope.errorMessage = 'Password is required.'
        return
])
