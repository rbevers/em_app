describe 'HomeController', ->
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

  describe 'access token requirement', ->
    it 'redirects if no access.token', ->
      $scope = {}
      $rootScope = {}
      $location = {
        path: (path)->
      }
      spyOn($location, 'path')
      controller = $controller('HomeController', $scope: $scope, $rootScope: $rootScope, $location: $location)
      expect($location.path).toHaveBeenCalledWith('/log_in')

    it 'loads if access.token is set', ->
      $scope = {}
      $rootScope = {
        access: {token: 'biglonguglytoken', expiry: Date.now() + 300000000}
      }
      $location = {
        path: (path)->
      }
      spyOn($location, 'path')
      $httpBackend.expectGET('/api/v1/account').respond(200, {})
      controller = $controller('HomeController', $scope: $scope, $rootScope: $rootScope, $location: $location)
      $httpBackend.flush()
      expect($location.path).not.toHaveBeenCalled()

  describe 'auto-fetch account', ->
    $rootScope = {
      access: {token: 'wereIN', expiry: Date.now() + 4000000}
    }

    it 'fetches user account for first/last in scope', ->
      $scope = {}
      $httpBackend.expectGET('/api/v1/account', {
        'Authorization': 'Bearer wereIN',
        'Accept': "application/json, text/plain, */*"
      }).respond(200, {first_name: 'Joe', last_name: 'Schmoe'})
      controller = $controller('HomeController', $scope: $scope, $rootScope: $rootScope)
      $httpBackend.flush()
      expect($scope.firstName).toEqual('Joe')
      expect($scope.lastName).toEqual('Schmoe')

