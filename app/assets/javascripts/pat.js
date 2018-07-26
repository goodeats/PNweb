'use strict';
(function(){
  console.log('if you can read this, you are probably a web developer :D');

  function init(){
    responsiveNavMenu();
    externalLinksListener();
    deviceOrientationListener();
  }

  function responsiveNavMenu(){
    $('#nav-toggle').on('click', function(e){
      e.preventDefault();
      $('#menu').slideToggle();
    });
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

  $(document).on('ready', function(){
    init();
  });

})();
