var app = angular.module('customers',[]); 
// angular.Module has a function named controller that will register controller function. 
app.controller("CustomerSearchController", [ 
    "$scope", 
    function($scope) {
      $scope.search = function(searchTerm) {
        $scope.searchedFor = searchTerm; 
      } 
    } 
]);