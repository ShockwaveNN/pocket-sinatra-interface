// Simple script that exports a users "Saved For Later" list out of Feedly
// as a JSON string.
//
// This was intended for use in the Google Chrome's "Inspector" tool so your
// mileage may vary if used in other contexts.
//
// Format of JSON is as follows:
//  [
//    {
//      title: "Title",
//      url: "www.example.com/title",
//      time: "Sunday "
//    }
//  ]
//
// How to use:
// 1) Open up Google Chrome
// 2) Login to Feedly and go to the "Saved For Later" list.
// 3) Keep scrolling down the page until all saved documents have been loaded
// 4) Right click on the page and select "Inspect Element"
// 5) Inside the "Inspector" tool, click the "Console" tab.
// 6) Paste the script below into the console
//
// NOTE: You must switch off SSL (http rather than https) or jQuery won't load!
 
// Feedly doesn't use jQuery so firstly inject it into the page
 
function loadJQuery(){
  script = document.createElement('script');
  script.setAttribute('src', '//code.jquery.com/jquery-2.1.3.js');
  script.setAttribute('type', 'text/javascript');
  script.onload = loadSaveAs;
  document.getElementsByTagName('head')[0].appendChild(script);
}
 
function loadSaveAs(){
  saveAsScript = document.createElement('script');
  saveAsScript.setAttribute('src', 'https://rawgit.com/eligrey/FileSaver.js/master/FileSaver.js');
  saveAsScript.setAttribute('type', 'text/javascript');
  saveAsScript.onload = saveToFile;
  document.getElementsByTagName('head')[0].appendChild(saveAsScript);
}
 
function saveToFile() {
  // Loop through the DOM, grabbing the information from each bookmark
  map = jQuery("#section0_column0 div.u0Entry").map(function(i, el) {
    var $el = jQuery(el);
    var regex = /published:(.*)\ --/i;
    return {
      title: $el.data("title"),
      url: $el.data("alternate-link"),
      time: regex.exec($el.find("div.lastModified span").attr("title"))[1]
    };
  }).get(); //  Convert jQuery object into an array
 
  // Convert to a nicely indented JSON string
  json = JSON.stringify(map, undefined, 2);
var blob = new Blob([json], {type: "text/plain;charset=utf-8"});
saveAs(blob, "FeedlySavedForLater" + Date.now().toString() + ".txt");
}
 
loadJQuery()
