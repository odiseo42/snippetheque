'use strict';

/* Directives */

app.directive('snippetsField', ['$compile', function() {
    var directiveDefinitionObject = {
        priority: 100,
        replace: true,
        templateUrl: 'app/templates/directives/snippetsField.html',
        scope: {
            'snippets' : '=',
            'queryTerm' : '='
        },
        link: function postLink($scope, element, attrs) {
            //console.log($scope);

        }
    };
    return directiveDefinitionObject;
}]);

RegExp.escape = function(str) {
    var specials = /[.*+?|()\[\]{}\\$^]/g; // .*+?|()[]{}\$^
    return str.replace(specials, "\\$&");
}


app.directive('snippet', ['$compile', function() {
  var directiveDefinitionObject = {
    priority: 10,
    link: function postLink($scope, element, attrs) {
        $scope.$parent.$watch('queryTerm', function( newVal, oldVal ){
            $(element).highlightRegex();
            if (newVal && newVal !== ""){                
                window.setTimeout(function(){
                    var regex;
                    try { 
                        regex = new RegExp(RegExp.escape(newVal), "gi");
                    }
                    catch (e) { 
                        //$('#fancy-input').addClass('error') 
                        console.log('Regex creation error', e);
                    }

                    if (typeof regex !== 'undefined') {
                        // console.log(regex);
                        $(element).highlightRegex(regex);
                        // console.log('poniendo coso');
                    }
                },1);
            }
        });     
    }
  };
  return directiveDefinitionObject;
}]);

app.directive('addNewSnippet', ['$compile', function() {
    var directiveDefinitionObject = {
        templateUrl: 'app/templates/directives/addNewSnippet.html',
        link: function postLink($scope, element, attrs) {
            $scope.editing = false;
            $scope.focusArea = function(){
                setTimeout(function(){
                    var textA = $(element).find('textarea');
                    textA.focus();
                },100);
            }
        }
    };
    return directiveDefinitionObject;
}]);


app.directive('searchBar', ['$compile', function() {
    var directiveDefinitionObject = {
        replace: true,
        templateUrl: 'app/templates/directives/searchBar.html',
        link: function postLink($scope, element, attrs) {
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