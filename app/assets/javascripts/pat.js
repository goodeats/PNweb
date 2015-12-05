console.log('if you can read this, you are probably a web developer :D');

$(document).ready(function(){
  var div = '<h3 id="scroll">1</h3>';
  $('.nav-content').append(div);
  $('#scroll').css({
    'position': 'absolute',
    'top': '50%',
    'left': '25%',
    'color': '#fff'
  });

  $(window).on('scroll', function(){
    var scroll_spot = $(window).scrollTop();
    $('#scroll').text(scroll_spot);
    var zoom = 1 + scroll_spot / 1000;

    $('.nav-content').css({
      '-moz-transform': 'scale(' + zoom + ',' + zoom + ')',
      '-webkit-transform': 'scale(' + zoom + ',' + zoom + ')',
      'transform': 'scale(' + zoom + ',' + zoom + ')'
    });
    


  });
});

