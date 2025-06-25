chequeApp.controller('HomeController', ['$scope', '$window', function($scope, $window) {

    // Redirect to login page
    $scope.goToLogin = function () {
        $window.location.href = 'login';
    };

    // Welcome message or feature highlights (optional)
    $scope.message = "Welcome to the Cheque Printing System";
}]);