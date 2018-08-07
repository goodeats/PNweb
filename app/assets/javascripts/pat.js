'use strict';
(function(){

  // https://twitter.com/ChromeDevTools/status/1023975167062499333
  // Tip: Format your console.log statements by prepending your text with "%c" and passing a second argument that contains the CSS styles.
  // this is mostly useless except for easter eggs, but could be helpful if you want an error to really pop in a sequence of console logs when debugging
  const consoleTextCss = [
    "color:#FDA085;",
    "font-family:'Montserrat', Helvetica, sans-serif;",
    "font-size:16px;"
  ];
  console.log('%cif you can read this, you are probably a web developer 🤓', consoleTextCss.join(''));

  // js functions run from modular js after init
  // https://www.innoarchitech.com/scalable-maintainable-javascript-modules/
  function init(){
    Nav.navToggleListener();
    GaTracking.externalLinksListener();
    MobileDevice.deviceOrientationListener();
    Alert.clearAlert();
  }

  // $(document).on('ready', function(){
  //   init();
  // });
  // https://stackoverflow.com/a/25984032
  // rails comes prepacked with jQuery, but use this instead :)
  document.addEventListener('DOMContentLoaded', function() {
    init();
  }, false);

})();
