(function(){
  console.log('if you can read this, you are probably a web developer :D');

  init();

  function init() {
    if (window.DeviceOrientationEvent) { // http://www.html5rocks.com/en/tutorials/device/orientation/
      // Listen for the deviceorientation event and handle the raw data
      window.addEventListener('deviceorientation', function(eventData) {
        // gamma is the left-to-right tilt in degrees, where right is positive
        var tiltLR = eventData.gamma;
        // beta is the front-to-back tilt in degrees, where front is positive
        var tiltFB = eventData.beta;
        // alpha is the compass direction the device is facing in degrees
        var dir = eventData.alpha;
        // call our orientation event handler
        deviceOrientationHandler(tiltLR, tiltFB, dir);
      }, false);
    }
  }

  function deviceOrientationHandler(tiltLR, tiltFB, dir) {
    var logo = document.getElementById("pat-logo");
    logo.style.webkitTransform = "rotate("+ tiltLR +"deg) rotate3d(1,0,0, "+ (tiltFB*-1)+"deg)";
    logo.style.MozTransform = "rotate("+ tiltLR +"deg)";
    logo.style.transform = "rotate("+ tiltLR +"deg) rotate3d(1,0,0, "+ (tiltFB*-1)+"deg)";
  }

  if (!navigator.userAgent.match('CriOS')){
    $(window).on('scroll', function(){
      var from_top = $(window).scrollTop();
      var above_one = 1 + from_top / 2000;
      var below_one = 1 - from_top / 2000;
      var rotate_left = -from_top / 50;
      var from_middle = 50 - rotate_left;
      $('#scroll').text(above_one);

      // rotate header and zoom
      // commented out, since it's confusing and jaggedy for mobile
      // $('.nav-content').css({
      //   '-webkit-transform': 'scale(' + above_one + ',' + above_one + ') rotate(' + (rotate_left / 100) + 'deg)',
      //   '-moz-transform': 'scale(' + above_one + ',' + above_one + ') rotate(' + (rotate_left / 100) + 'deg)',
      //   '-o-transform': 'scale(' + above_one + ',' + above_one + ') rotate(' + (rotate_left / 100) + 'deg)',
      //   'transform': 'scale(' + above_one + ',' + above_one + ') rotate(' + (rotate_left / 100) + 'deg)',
      //   'background-position': from_middle + '% 50%',
      //   'margin-left': -from_top / 20 + 'px',
      //   'margin-bottom': -from_top / 10 + 'px',
      // });

      // rotate title, space letters
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

})();
