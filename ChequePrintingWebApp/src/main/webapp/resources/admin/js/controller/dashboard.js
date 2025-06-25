chequeApp.controller('DashboardController', function ($scope, $window) {
	$http.get(AppConfig.apiUrl + '/users/profile').then(function(response) {
	    if (!response.data || !response.data.userId) {
	        $window.location.href = AppConfig.baseUrl + '/login';
	    } else {
	        $scope.loggedUser = response.data;
	        // show user info or dashboard
	    }
	});
});  