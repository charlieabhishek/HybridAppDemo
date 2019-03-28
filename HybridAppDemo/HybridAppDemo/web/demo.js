var app = angular.module('demoApp', []);

app.controller('demoCtrl', function ($scope) {
   console.log('demo Controller');

   $scope.nativeMessage = '';

   $scope.callNativeBtnAction = function () {
      console.log('callNativeBtnAction');
      try {
         webkit.messageHandlers.callback.postMessage("Web to Native Message");
       } catch(err) {
         console.log('Can not reach native code');
       }
   };               
});
