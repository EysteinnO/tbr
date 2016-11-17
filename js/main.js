'use strict';

var app = angular.module('SomeApp', ['ngRoute', 'ngResource', 'mm.foundation']);

app.directive('routeLoader', function() {
  return {
    restrict: 'EA',
    link: function(scope, element) {
      // Store original display mode of element
      var shownType = element.css('display');
      function hideElement() {
        element.css('display', 'none');
      }
            
      scope.$on('$routeChangeStart', function() {
        element.css('display', shownType);
      });
      scope.$on('$routeChangeSuccess',hideElement);
      scope.$on('$routeChangeError', hideElement);
      // Initially element is hidden
      hideElement();
    }
  }
});

app.controller('MainController', function($scope, $route, $routeParams, $location) {
     $scope.$route = $route;
     $scope.$location = $location;
     $scope.$routeParams = $routeParams; 
});

app.config(function($routeProvider, $locationProvider){
  $locationProvider.html5Mode(true).hashPrefix('!');

  $routeProvider
    .when('/main', {
      templateUrl: '/js/templates/templateHome.html',
    })
    .otherwise({
      redirectTo: '/main'
    })
});