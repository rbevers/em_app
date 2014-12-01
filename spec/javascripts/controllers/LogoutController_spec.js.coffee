describe 'LogoutController', ->
  beforeEach(module('emApp'))

  $controller = null

  beforeEach(inject((_$controller_)->
    $controller = _$controller_
  ))

  it 'purges access and redirects to logout', ->
    $scope = {}
    $rootScope = {
      access: {token: 'ineedtogo', expiry: Date.now()}
    }
    $location = {
      path: (path)->
    }
    spyOn($location, 'path')
    controller = $controller('LogoutController', $scope: $scope, $rootScope: $rootScope, $location: $location)
    expect($rootScope.access).toBeNull()
    expect($location.path).toHaveBeenCalledWith('/log_in')

