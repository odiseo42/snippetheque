function SnippetListCtrl($scope, Phone) {
	// var $defer = $http.get(servicesUrl+'/snippets');
	 
	// $defer.success(function (data) { 
	// 	$scope.snippets = data;
	// 	$scope.snippetsLoaded = true;

	// })
	// $defer.error(function () { 
	// 	log('gulp!'); 
	// 	$scope.snippetsLoaded = false;
	// });


	// $scope.getSnippets = function(){
	// 	return $scope.snippets;
	// };

	$scope.snippets = Phone.query();
}
