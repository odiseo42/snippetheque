function SnippetListCtrl($scope, Snippets) {

	$scope.snippets = [];
	$scope.loadedIds = [];
	$scope.failedToLoadSnippets = false;

	// Snippets.get({}, function(snippets){//success
	// 	$scope.refreshSnippets(snippets);
	// }, function(){//fail
	// 	$scope.failedToLoadSnippets = true;
	// });

	var failLoad = function(){
		console.log('failed to load your snippets');
		$scope.failedToLoadSnippets = true;
	}
	var successLoad = function(){
		if($scope.failedToLoadSnippets) {
			$scope.failedToLoadSnippets = false;			
		}
	}

	//empty query return latest 5 snippets
	$scope.snippets = Snippets.get({}, successLoad, failLoad);

	$scope.$watch('queryTerm', function( val ){
		if( val && val.length > 2 ){

			// Snippets.query({term: val}, 
			// 	function(snippets) { //success
			// 		$scope.refreshSnippets(snippets);
			// 	},
			// 	function(){ //error
			// 		$scope.failedToLoadSnippets = true;
			// 	});		

			Snippets.query({term: val}, 
				function(results){
					$scope.updateSnippets(results);
				}, failLoad);
		}
	});

	$scope.$watch('snippets.length', function(val){
		$scope.loadedIds = $.map($scope.snippets, function(snip){
			return snip.id;
		});
	});


	$scope.updateSnippets = function(newSnippets){
		$.each(newSnippets, function(index, val){
			if(!isNaN(index) && index > 0){
				var snip = newSnippets[index];
				var snip_id = snip.id;

				if( isMergeableId(snip_id) ){
					console.log('inserting', snip);
					$scope.snippets.push(snip);
				}			
			}
		});
	};

	//we only insert snips that are not already loaded in the client side
	function isMergeableId(id){
		if(isNaN(id) || id < 1 || id === undefined){
			return false;
		}

		for(var i = 0; i < $scope.loadedIds.length; i++){
			if($scope.loadedIds[i] == id){
				return false;
			}
		}
		return true;
	}

	$scope.addSnippet = function(content){
		var newSnip = new Snippets();
		newSnip.content = content;
		newSnip.$save(function(newSnip, headers){
			var snipWrapper = [newSnip];
			$scope.updateSnippets(newSnip);			
		});
	}

}

