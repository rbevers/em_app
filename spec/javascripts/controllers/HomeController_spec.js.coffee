describe 'HomeController', ->
  beforeEach(module('emApp'))

  $controller = null
  beforeEach(inject((_$controller_)->
    $controller = _$controller_
  ))

  describe 'access token requirements', ->
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
      controller = $controller('HomeController', $scope: $scope, $rootScope: $rootScope, $location: $location)
      expect($location.path).not.toHaveBeenCalled()

