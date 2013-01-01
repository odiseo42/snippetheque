 'use strict';

/* Services */


var services = angular.module('snippsServices', ['ngResource']);

services.factory('Snippet', function($resource){
		return $resource('services.php/snippets/:term', {}, {
    		query: {method:'GET'},
  		});
	}
); 