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

app.controller('TeamsController', function($scope, $routeParams, $http) {
  $scope.name = "TeamsController";
  $scope.params = $routeParams;

  $scope.teamData = {
    td: {},

    getData: function(){
      $http({
        method: 'POST',
        url: '/php/post.teams.selected.php',
        data: {teamid: $scope.params.teamid}
      }).then(function successCallback(response) {
          $scope.td = response.data;
        }, function errorCallback(response) {
          console.log("Failed to retrieve data Team Information.")
        });
    }

  };

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