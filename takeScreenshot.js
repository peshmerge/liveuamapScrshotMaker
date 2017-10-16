var system = require('system');
var page = require('webpage').create();
var day,month,year;
day= system.args[1];
month= system.args[2];
year = system.args[3];
var newDay=day;
var newMonth=month;
if(day<10){
    newDay = '0'+day;
}
if(month<10){
    newMonth = '0'+month;
}
var fileName=year+'-'+month+'-'+day;
var url= "https://isis.liveuamap.com/en/time/"+newDay+'.'+newMonth+'.'+year;
console.log("Creating a screenshot for "+url);
page.viewportSize = { width:2880 , height:1800  };
page.open(url, function() {
    console.log("Removing elements from the page....");
    var p = page.evaluate(function() {
        //remove icons and all other stuff from the page to get a clean image
        (document.querySelector('.leaflet-bottom.leaflet-left')).style.display='none !important';
        (document.querySelector('.leaflet-bottom.leaflet-right')).style.display='none';
        (document.querySelector('.leaflet-marker-pane')).style.display='none';
        (document.querySelector('.news-lent')).remove();
        (document.querySelector('.header')).style.display='none';
        return document.getElementsByClassName("leaflet-pane leaflet-overlay-pane")[0].getBoundingClientRect();
    });
    
  
    page.render(fileName+'.png');
    console.log(fileName+".png saved to the disk");
    phantom.exit();
});