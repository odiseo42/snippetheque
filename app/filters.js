'use strict';

/* Filters */

angular.module('snippetFilters', []).filter('snippSort', function() {
  return function(input, mod) {
    log('filter input is');
    log(input);
    log(mod)
    return input;
  };
});
