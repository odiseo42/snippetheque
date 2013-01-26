'use strict';

/* Directives */

app.directive('snippet', ['$compile', function() {
  var directiveDefinitionObject = {
  	priority: 1,
    link: function postLink($scope, element, attrs) {

		$scope.$parent.$watch('queryTerm', function( newVal, oldVal ){
			window.setTimeout(function(){
				// console.log('newVal:'+newVal+', oldVal:'+oldVal);
				var regex;
				$(element).highlightRegex();
				try { 
					regex = new RegExp(newVal, 'ig') }
				catch (e) { 
					//$('#fancy-input').addClass('error') 
					console.log('Regex creation error');
				}

				if (typeof regex !== 'undefined') {
					// console.log(regex);
					$(element).highlightRegex(regex);
					// console.log('poniendo coso');
				}
			},1);
		});    	
    }
  };
  return directiveDefinitionObject;
}]);

app.directive('addNewSnippet', ['$compile', function() {
  var directiveDefinitionObject = {
  	templateUrl: '/templates/addNewSnippet.html',
    link: function postLink($scope, element, attrs) {
    	$scope.editing = false;
    	// $(element).bind('click', function(){
    	// 	alert('clicked');
    	// });
    }
  };
  return directiveDefinitionObject;
}]);

app.directive('ngEnter', function() {
    return function(scope, element, attrs) {
        element.bind('keypress', function(e) {
            if (e.charCode === 13 || e.keyCode ===13 ) {
              scope.$apply(attrs.ngEnter);
            }
        });
    };
});   