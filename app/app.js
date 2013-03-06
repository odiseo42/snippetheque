'use strict';
window.log = function(str){
    console.log(str);

}
var servicesUrl = '/services.php';

/* App Module */
var app = angular.module( 'snippetheque', ['snippsServices', 'snippetFilters', 'ui'] );


app.config(['$routeProvider', function($routeProvider) {
  $routeProvider.
      when('/home', {templateUrl: '/app/templates/main-app.html',   controller: SnippetListCtrl}).
      when('/help', {templateUrl: '/app/templates/help.html'}).      
      when('/about', {templateUrl: '/app/templates/about.html'}).      

      otherwise({redirectTo: '/home'});
}]);
