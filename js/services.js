 'use strict';

/* Services */


var services = angular.module( 'snippsServices', ['ngResource'] );

services.factory('Snippet', function( $resource ){
		return $resource('services.php/snippets/:term', {}, {
    		get: {method:'GET', isArray:true}

  		});
	}
); 