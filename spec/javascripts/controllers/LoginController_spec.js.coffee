describe 'LoginController', ->
  beforeEach(module('emApp'))

  $controller = null
  $httpBackend = null

  beforeEach(inject((_$controller_, _$httpBackend_)->
    $controller = _$controller_
    $httpBackend = _$httpBackend_
  ))

  afterEach( ->
    $httpBackend.verifyNoOutstandingExpectation()
    $httpBackend.verifyNoOutstandingRequest()
  )

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

    it 'requests an OAuth access token & sets rootScope on success', ->
      $scope = {}
      $rootScope = {}
      controller = $controller('LoginController', $scope: $scope, $rootScope: $rootScope)
      $httpBackend.expectPOST('/oauth/token', {
        grant_type: 'password',
        username: 'foo@bigbar.com',
        password: 'woahHoss!'
      }).respond(200, {
        "access_token":"fdc261582e02e8ef2a663f58f89373a7789c890c3ec031c05a36b4d67877ba8d",
        "token_type":"bearer",
        "expires_in":7200
      })
      $scope.email = 'foo@bigbar.com'
      $scope.password = 'woahHoss!'
      $scope.login()
      $httpBackend.flush()
      expect($rootScope.access).toBeDefined()
      expect($rootScope.access.token).toEqual("fdc261582e02e8ef2a663f58f89373a7789c890c3ec031c05a36b4d67877ba8d")
      expect($rootScope.access.expiry).toBeTruthy()

    it 'redirects to home after successful login', ->
      $scope = {}
      $location = {
        path: (path)->
      }
      spyOn($location, 'path')
      controller = $controller('LoginController', $scope: $scope, $location: $location)
      $httpBackend.expectPOST('/oauth/token', {
        grant_type: 'password',
        username: 'jones@bigbar.com',
        password: 'woahHoss!'
      }).respond(200, {
        "access_token":"fdc261582e02e8ef2a663f58f89373a7789c890c3ec031c05a36b4d67877ba8d",
        "token_type":"bearer",
        "expires_in":7200
      })
      $scope.email = 'jones@bigbar.com'
      $scope.password = 'woahHoss!'
      $scope.login()
      $httpBackend.flush()
      expect($location.path).toHaveBeenCalledWith('/')

