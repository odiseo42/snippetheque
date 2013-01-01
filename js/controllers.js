function SnippetListCtrl($scope, Snippet) {
	$scope.snippets = Snippet.query();


	$scope.$watch('query',function(newVal){	
		var response = Snippet.query({term: newVal}, function(res) {
		});
		console.log(response);
		$.each(response, function(res){
			log(res);
		});
		$scope.snippets = response;
	});
}

