'use strict';

var Nav = Nav || {

};

Nav = (function(module){

  // there's only one event to listen for so going right into that
  // this is not a complicated site... yet?

  const transitionMainDuration = 300;

  module.navToggleListener = function(){
    // https://codepen.io/javiier507/pen/eJNjWq
    $('#nav-toggle').on('click', function(e){
      e.preventDefault();
      $(this).toggleClass('is-active');
      $('#menu').slideToggle(transitionMainDuration);
      $('#nav').toggleClass('nav-active');
    });
  };

  return module;

})(Nav || {});
