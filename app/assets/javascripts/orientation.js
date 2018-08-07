'use strict';

var MobileDevice = MobileDevice || {

};

MobileDevice = (function(module){

  var deviceOrientationHandler = function(tiltLR, tiltFB, dir){
    var logo = document.getElementById("pat-logo");
    logo.style.webkitTransform = "rotate("+ tiltLR +"deg) rotate3d(1,0,0, "+ (tiltFB*-1)+"deg)";
       logo.style.MozTransform = "rotate("+ tiltLR +"deg) rotate3d(1,0,0, "+ (tiltFB*-1)+"deg)";
          logo.style.transform = "rotate("+ tiltLR +"deg) rotate3d(1,0,0, "+ (tiltFB*-1)+"deg)";
  };

  module.deviceOrientationListener = function(){
    // http://www.html5rocks.com/en/tutorials/device/orientation/
    if (window.DeviceOrientationEvent){
      // Listen for the deviceorientation event and handle the raw data
      window.addEventListener('deviceorientation', function(eventData){
        // gamma is the left-to-right tilt in degrees, where right is positive
        var tiltLR = eventData.gamma;
        // beta is the front-to-back tilt in degrees, where front is positive
        var tiltFB = eventData.beta - 45;
        // alpha is the compass direction the device is facing in degrees
        var dir = eventData.alpha;
        // call our orientation event handler
        deviceOrientationHandler(tiltLR, tiltFB, dir);
      }, false);
    }
  };

  return module;

})(MobileDevice || {});
