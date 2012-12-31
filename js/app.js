'use strict';
window.log = function(str){
	console.log(str);

}
var servicesUrl = '/services.php';

/* App Module */

angular.module('snippetheque', ['phonecatFilters', 'phonecatServices']);
