function SnippetListCtrl($scope, Snippets, $routeParams) {

    $scope.snippets = [];
    $scope.loadedIds = [];
    $scope.failedToLoadSnippets = false;
    $scope.nonSearchResultsIds = [];
    $scope.lastLoadedId = 0;

    //When loading the application, we make an empty query
    //empty query returns the latest 5 snippets
    Snippets.query({}, function(results){
            $scope.updateSnippets(results, true);
            successLoad();                
        }, failLoad); 


    /**
     * Controller functions    
     *
     */
    $scope.updateSnippets = function( newSnippets, nonsearch ){
        angular.forEach(newSnippets, function( snip ){
            if (isMergeableId(snip.id)){
                $scope.snippets.push( snip );
                if (nonsearch === true){
                    $scope.nonSearchResultsIds.push(snip.id);
                }
            }   
        });
    };

    $scope.addSnippet = function(content){
        var newSnip = new Snippets();
        newSnip.content = content;
        newSnip.$save( function(newSnip, headers){
            var snipWrapper = [newSnip];
            $scope.updateSnippets(newSnip);         
        });
    };

    $scope.resetSearch = function($event){
        $scope.queryTerm = "";
    };

    $scope.loadMore = function(){
        var paramsObj = {};
        if ($scope.queryTerm != ""){
            paramsObj.term = $scope.queryTerm;
        }
        paramsObj.lastid = $scope.lastLoadedId;


        Snippets.query(paramsObj, function(results){
                $scope.updateSnippets(results, true);
            }, failLoad);  

        scrollToBottom();
    };

    //TODO
    $scope.snipOrder = function(snip){

    };
    
    /**
     * Watchers
     *
     */
    $scope.$watch('queryTerm', function( val ){
        if ( val && val.length > 2 ){
            Snippets.query({term: val}, 
                function(results){
                    $scope.updateSnippets(results);
                }, failLoad);
        }
    });

    $scope.$watch('nonSearchResultsIds.length', function(val, oldval){
        var arr = $scope.nonSearchResultsIds.sort(function(a,b){return a - b});
        var last = arr[0];
        $scope.lastLoadedId = last;
    });       

    /**
     * Other functions
     *
     */
    function failLoad(){
        console.log('failed to load your snippets');
        $scope.failedToLoadSnippets = true;
    }
    function successLoad(){
        if ($scope.failedToLoadSnippets) {
            $scope.failedToLoadSnippets = false;            
        }
    }

    //we only insert snippetss that are not already loaded on the client side
    function isMergeableId( id ){
        if (isNaN(id) || id < 1 || id === undefined || id === null){
            return false;
        }

        angular.forEach($scope.snippets, function(snippet){
            if (snippet.id === id){
                return false;
            }            
        });
        return true;
    }

    function scrollToBottom(){
        $("html, body").animate({ scrollTop: $(document).height()+10000 }, "slow");
    }    
}

