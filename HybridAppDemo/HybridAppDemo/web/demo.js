var app = angular.module('demoApp', []);
app.controller('demoCtrl', function($scope) {
   console.log('demo Controller'); 

   $scope.callNativeBtnAction = function(){
      console.log('callNativeBtnAction'); 
   }
});