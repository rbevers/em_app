describe 'HomeController', ->
  beforeEach(module('emApp'))

  $controller = null
  beforeEach(inject((_$controller_)->
    $controller = _$controller_
  ))

  describe 'prerequisites', ->
    it 'requires an accessToken', ->
      $scope = {}
      $rootScope = {}
      redirectedTo = null
      $location = {
        path: (path)->
      }
      spyOn($location, 'path')
      controller = $controller('HomeController', $scope: $scope, $rootScope: $rootScope, $location: $location)
      expect($location.path).toHaveBeenCalledWith('/log_in')
