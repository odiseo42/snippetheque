 'use strict';

/* Services */


var services = angular.module( 'snippsServices', ['ngResource'] );

services.factory('Snippets', function( $resource ){
        return $resource('services.php/userid/:userid/query/:term/lastid/:lastid', {userid:1}, {} );
    }
); 