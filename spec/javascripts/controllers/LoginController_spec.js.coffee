describe 'LoginController', ->
  beforeEach(module('emApp'))

  $controller = null
  beforeEach(inject((_$controller_)->
    $controller = _$controller_
  ))

  describe 'starting scope', ->
    it 'starts with no email and password', ->
      $scope = {}
      controller = $controller('LoginController', $scope: $scope)
      expect($scope.email).toBeNull()
      expect($scope.password).toBeNull()

  describe 'login', ->
    it 'requires an email value', ->
      $scope = {}
      controller = $controller('LoginController', $scope: $scope)
      $scope.login()
      expect($scope.errorMessage).toEqual("Email is required.")

    it 'requires a password value', ->
      $scope = {}
      controller = $controller('LoginController', $scope: $scope)
      $scope.email = 'foo@bar.com'
      $scope.login()
      expect($scope.errorMessage).toEqual("Password is required.")
