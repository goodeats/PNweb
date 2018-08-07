'use strict';

// some mild practice of using google analytics

var GaTracking = GaTracking || {

};

GaTracking = (function(module){

  function sendGAEvent(link, category, action, label){
    // google analytics: which link is clicked
    ga('send', 'event', category, action, label);
  }

  // in case I care to see how often visitors discover the contact links hover mixin effects
  // I didn't really have much JS going when I first built this site...
  var contactHoverCount = 0;
  function contactLinkHovered(link){
    var label = link.id.split('-')[0];
    contactHoverCount++;
    sendGAEvent(link, 'hover contact', 'count: ' + contactHoverCount, label);
  }

  function openInNewTab(url) {
    var win = window.open(url, '_blank');
    win.focus();
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

  module.externalLinksListener = function(){
    var patLink = $('.pat-link');
    patLink.on({
      click: function(e){
        e.preventDefault();
        externalLinkClicked(this);
      },
      // example of chaining event listeners to a dom element
      mouseenter: function(e){
        e.stopImmediatePropagation();
        if (this.classList.contains('contact-link')){
          contactLinkHovered(this);
        }
      }
    });
  };

  return module;

})(GaTracking || {});
