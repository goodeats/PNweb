'use strict';
(function(){
  console.log('if you can read this, you are probably a web developer :D');

  function init(){
    externalLinksListener();
    deviceOrientationListener();
    headerScrollListener();
  }

  function externalLinksListener(){
    var patLink = $('.pat-link');
    patLink.on({
      click: function(e){
        e.preventDefault();
        externalLinkClicked(this);
      },
      mouseenter: function(e){
        e.stopImmediatePropagation();
        if (this.classList.contains('contact-link')){
          contactLinkHovered(this);
        }
      }
    });
  }

  function externalLinkClicked(link){
    var action = 'page',
        label = link.id.split('-')[0];
    if (link.classList.contains('contact-link')){
      action = 'contact';
    }

    sendGAEvent(link, 'external link', action, label);
    openInNewTab(link.href);
  }

  var contactHoverCount = 0;
  function contactLinkHovered(link){
    var label = link.id.split('-')[0];
    contactHoverCount++;
    sendGAEvent(link, 'hover contact', 'count: ' + contactHoverCount, label);
  }

  function sendGAEvent(link, category, action, label){
    // google analytics: which link is clicked
    ga('send', 'event', category, action, label);
  }

  function openInNewTab(url) {
    var win = window.open(url, '_blank');
    win.focus();
  }

  function deviceOrientationListener(){
    // http://www.html5rocks.com/en/tutorials/device/orientation/
    if (window.DeviceOrientationEvent){
      // Listen for the deviceorientation event and handle the raw data
      window.addEventListener('deviceorientation', function(eventData){
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

  function deviceOrientationHandler(tiltLR, tiltFB, dir){
    var logo = document.getElementById("pat-logo");
    logo.style.webkitTransform = "rotate("+ tiltLR +"deg) rotate3d(1,0,0, "+ (tiltFB*-1)+"deg)";
       logo.style.MozTransform = "rotate("+ tiltLR +"deg) rotate3d(1,0,0, "+ (tiltFB*-1)+"deg)";
          logo.style.transform = "rotate("+ tiltLR +"deg) rotate3d(1,0,0, "+ (tiltFB*-1)+"deg)";
  }

  function headerScrollListener(){
    // header pullaway doesn't work while scrolling in chrome
    if (!navigator.userAgent.match('CriOS')){
      $(window).on('scroll', function(){
        var from_top = $(window).scrollTop();
        var above_one = 1 + from_top / 2000;
        var below_one = 1 - from_top / 2000;
        var rotate_left = -from_top / 50;
        var from_middle = 50 - rotate_left;

        // rotate header and zoom
        // commented out, since it's confusing and jaggedy for mobile
        // $('.nav-content').css({
        //   'background-position': from_middle + '% 50%',
        //   'margin-left': -from_top / 20 + 'px',
        //   'margin-bottom': -from_top / 10 + 'px',
        //   '-webkit-transform': 'scale(' + above_one + ',' + above_one + ') rotate(' + (rotate_left / 100) + 'deg)',
           //   '-moz-transform': 'scale(' + above_one + ',' + above_one + ') rotate(' + (rotate_left / 100) + 'deg)',
             //   '-o-transform': 'scale(' + above_one + ',' + above_one + ') rotate(' + (rotate_left / 100) + 'deg)',
                //   'transform': 'scale(' + above_one + ',' + above_one + ') rotate(' + (rotate_left / 100) + 'deg)',
        // });

        // rotate title, space letters
        $('.nav-title-name').css({
          'right': 10 + from_top / 100 + '%',
          'letter-spacing': -5 + -rotate_left + 'px',
          '-webkit-transform': 'scale(' + below_one + ',' + below_one + ') rotate(' + rotate_left + 'deg)',
             '-moz-transform': 'scale(' + below_one + ',' + below_one + ') rotate(' + rotate_left + 'deg)',
               '-o-transform': 'scale(' + below_one + ',' + below_one + ') rotate(' + rotate_left + 'deg)',
                  'transform': 'scale(' + below_one + ',' + below_one + ') rotate(' + rotate_left + 'deg)'
        });
      });
    }
  }

  $(document).on('ready', function(){
    init();
  });

})();
