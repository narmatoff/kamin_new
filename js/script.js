// Code goes here

angular.module('myApp', ['ngMaterial'])
.controller('AppCtrl', ['$scope', '$interval',
    function($scope, $interval) {
      $scope.mode = 'query';
      $scope.determinateValue = 10;
      $interval(function() {
        $scope.determinateValue += 2;
        if ($scope.determinateValue > 100) {
          $scope.determinateValue = 10;
        }
      }, 100, 0, true);
    }
  ]);

