Kucheka.controller "KuchekaUserCtrl", KuchekaUserCtrl = ($scope, $http, $resource, $routeParams, $location) ->
  $scope.slug = $routeParams.slug

  $scope.name = "Vasily"
  $scope.bio = "Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Donec id elit non mi porta gravida at eget metus."
