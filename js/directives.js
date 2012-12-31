var app = angular.module('snippetheque', []);


app.directive('snippet', ['$compile', function() {
  var directiveDefinitionObject = {
    link: function postLink($scope, element, attrs) {
    	window.setTimeout(function(){
		  $scope.$parent.$watch('query',function(newVal, oldVal){
		  	if(newVal != oldVal){
				console.log('newVal:'+newVal+', oldVal:'+oldVal);
				var regex;
				$(element).highlightRegex();
				try { 
					regex = new RegExp(newVal, 'ig') }
				catch (e) { 
					//$('#fancy-input').addClass('error') 
					console.log('Regex creation error');
				}

				if (typeof regex !== 'undefined') {
					console.log(regex);
					$(element).highlightRegex(regex);
					console.log('poniendo coso');
				}
		  	}
		  });


    	},0);
    }
  };
  return directiveDefinitionObject;
}]);