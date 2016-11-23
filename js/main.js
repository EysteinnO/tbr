'use strict';

var app = angular.module('SomeApp', ['ngCookies', 'ngRoute', 'ngResource', 'mm.foundation']);

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

app.factory('TeamInfo', function($resource) {

    return $resource('/php/get.teams.selected.php', {}, {
      getData: {
        method: 'POST',
        params: ,
        isArray: false
      }
    });

});

app.controller('TeamsController', function($scope, $routeParams, TeamInfo) {
  $scope.name = "TeamsController";
  $scope.params = $routeParams;

  $scope.teamData = {
    td: TeamInfo.getData(),

    teamFilter: function(array){

      return array["teams"];

    },

    usersFilter: function(array){
      return array["users"];
    }

  };

  $scope.ifUser = {
    ui: $cookieStore.get('userid'),


  }

});

app.controller('MainController', function($scope, $route, $routeParams, $location, $cookies, $cookieStore) {
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
    .when('/teams/:teamid', {
      templateUrl: '/js/templates/templateTeams.html',
      controller: 'TeamsController'
    })
    .otherwise({
      redirectTo: '/main'
    })
});