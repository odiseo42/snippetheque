function SnippetListCtrl($scope, Snippet) {

	//empty query return latest snippets
	$scope.snippets = Snippet.query();

	$scope.$watch('queryTerm',function(search){	
		Snippet.query({term: search}, function(res) {
			$scope.appendSnipp(res);
			$scope.loadedIds = $scope.getLoadedIds();
		});
		
		//$scope.snippets = Snippet.query({term: search});

		log($scope.snippets);
	});


	$scope.getLoadedIds = function(){
		var ids = [];
		for(var i in $scope.snippets) {
			if(!isNaN(i) ){
				ids.push(i);
			}
		}
		return ids;
	};

	$scope.appendSnipp = function(res){
		if($scope.snippets){
			for(var i in res) {
				if(!isNaN(i) && !(i in $scope.snippets)){
					//log(res[i]);
					$scope.snippets[i] = res[i];
				}
			}			
		}
	};


}

