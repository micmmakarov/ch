Kucheka = angular.module('Kucheka', ['ngResource'])

Kucheka.controller "KuchekaCtrl", KuchekaCtrl = ($scope, $http, $resource, $routeParams, $location) ->

  $scope.isActive = (route) ->
    route is $location.path()