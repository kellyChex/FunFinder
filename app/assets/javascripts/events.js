$( document ).ready(function() {
  $("#event_location").geocomplete();

  $("input[name=commit]").click(function(){
    var place = autocomplete.getPlace();
    document.getElementById('event_latitude').value = place.geometry.location.lat();
    document.getElementById('event_longitude').value = place.geometry.location.lng();
  });
});
var directionsDisplay,
    directionsService,
    map;

google.maps.event.addDomListener(window, "load", initMap);
function initMap() {
  var directionsService = new google.maps.DirectionsService();
  directionsDisplay = new google.maps.DirectionsRenderer()
  var latitude = document.getElementById("latitude").getAttribute("value");
  var longitude = document.getElementById("longitude").getAttribute("value");
  var location = new google.maps.LatLng(latitude,longitude);
  var mapOptions = { zoom:13, center: location }
  map = new google.maps.Map(document.getElementById("map"), mapOptions);
  directionsDisplay.setMap(map);
}
