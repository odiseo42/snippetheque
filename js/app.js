'use strict';
window.log = function(str){
	console.log(str);

}
var servicesUrl = '/services.php';

/* App Module */
var app = angular.module('snippetheque', ['snippsServices']);
