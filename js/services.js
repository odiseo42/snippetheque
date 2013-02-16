 'use strict';

/* Services */


var services = angular.module( 'snippsServices', ['ngResource'] );

services.factory('Snippets', function( $resource ){
		return $resource('services.php/userid/:userid/query/:term/', {userid:1}, {
    		get: {method:'GET', isArray:true}

  		});
	}
); 