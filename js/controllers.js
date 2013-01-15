function SnippetListCtrl($scope, Snippet) {

	//empty query return latest snippets
	$scope.snippets = [];
	$scope.loadedIds = [];
	$scope.failedToLoadSnippets = false;

	Snippet.get({}, function(snippets){
		$scope.refreshSnippets(snippets);
	}, function(){$scope.failedToLoadSnippets = true;});


	$scope.$watch('queryTerm', function( val ){
		if( val && val.length > 2 ){

			Snippet.query({method:'POST', term: val, isArray:true}, 
				function(snippets) { //success
					$scope.refreshSnippets(snippets);
				},
				function(){ //error
					$scope.failedToLoadSnippets = true;
				});		

		}
	});

	$scope.refreshSnippets = function(snippets){
		for( i in snippets ){
			var snip_id = snippets[i].id;
			if( !isIdLoaded(snip_id) ){
				$scope.loadedIds.push(snip_id);		
				$scope.snippets.push(snippets[i]);
				$scope.failedToLoadSnippets = false;
			}
		}
	};

	function isIdLoaded(id){
		for(var i = 0; i < $scope.loadedIds.length; i++){
			if($scope.loadedIds[i] == id){
				return true;
			}
		}
		return false;
	}

}

