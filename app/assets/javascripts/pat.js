console.log('if you can read this, you are probably a web developer :D');

$(document).ready(function(){

  var sec = 0;
  function pad(val) {
    return val > 9 ? val : "0" + val;
  }
  var timer = setInterval(function () {
    document.getElementById("seconds").innerHTML = pad(++sec % 60);
    document.getElementById("minutes").innerHTML = pad(parseInt(sec / 60, 10));
  }, 1000);
  setTimeout(function () {
    clearInterval(timer);
  }, 11000);

  var div = "<h4 id='scroll'></h4>";
  $('.nav-content').append(div);
  $('#scroll').css({
    'position': 'absolute',
    'top': '50%',
    'right': '20%',
    'color': '#fff'
  });
  if(navigator.userAgent.match('CriOS')){
    alert('urine chrome ios!');
    $('.nav-title-name').text('Pat \"too cool for school\" Needham');
    var s = skrollr.init({
      smoothScrolling: false,
      mobileDeceleration: 0.004
    });
  } else {
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
  }
});

