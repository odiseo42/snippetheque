'use strict';
window.log = function(str){
    console.log(str);

}
var servicesUrl = '/services.php';

/* App Module */
var app = angular.module( 'snippetheque', ['snippsServices', 'snippetFilters', 'ui'] );


app.config(['$routeProvider', function($routeProvider) {
  $routeProvider.
      when('/home', {templateUrl: 'templates/main-app.html',   controller: SnippetListCtrl}).
      when('/help', {templateUrl: 'templates/help.html'}).      
      when('/about', {templateUrl: 'templates/about.html'}).      

      otherwise({redirectTo: '/home'});
}]);
