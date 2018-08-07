'use strict';

var Alert = Alert || {

};

Alert = (function(module){

  module.clearAlert = function(){
    setTimeout(function() {
      $('.flash').slideUp();
    }, 3000);
  };

  return module;

})(Alert || {});
