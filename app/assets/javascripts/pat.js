console.log('if you can read this, you are probably a web developer :D');

$(document).ready(function(){
  if(navigator.userAgent.match('CriOS')){
    var s = skrollr.init({
      smoothScrolling: false,
      mobileDeceleration: 0.004
    });
  }

  $(window).on('scroll', function(){
    console.log('ahhh! I\'m falling!')
    var from_top = $(window).scrollTop();
    var above_one = 1 + from_top / 2000;
    var below_one = 1 - from_top / 2000;
    var rotate_left = -from_top / 50;
    var from_middle = 50 - rotate_left;
    $('#scroll').text(above_one);

    $('.nav-content').css({
      '-webkit-transform': 'scale(' + above_one + ',' + above_one + ') rotate(' + rotate_left + 'deg)',
      '-moz-transform': 'scale(' + above_one + ',' + above_one + ') rotate(' + rotate_left + 'deg)',
      '-o-transform': 'scale(' + above_one + ',' + above_one + ') rotate(' + rotate_left + 'deg)',
      'transform': 'scale(' + above_one + ',' + above_one + ') rotate(' + rotate_left + 'deg)',
      'background-position': from_middle + '% 50%',
      'margin-left': -from_top / 20 + 'px',
      'margin-bottom': -from_top / 10 + 'px',
    });
    
    $('.nav-title-name').css({
      '-webkit-transform': 'scale(' + below_one + ',' + below_one + ') rotate(' + rotate_left + 'deg)',
      '-moz-transform': 'scale(' + below_one + ',' + below_one + ') rotate(' + rotate_left + 'deg)',
      '-o-transform': 'scale(' + below_one + ',' + below_one + ') rotate(' + rotate_left + 'deg)',
      'transform': 'scale(' + below_one + ',' + below_one + ') rotate(' + rotate_left + 'deg)',
      'right': 10 + from_top / 100 + '%',
      'letter-spacing': -5 + -rotate_left + 'px'
    });

  });
});

