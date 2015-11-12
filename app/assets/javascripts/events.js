$( document ).ready(function() {
  $("#event_location").geocomplete();
});

function initMap() {
  var map = new google.maps.Map(document.getElementById("map"), {
    center: {lat: 32.7150, lng: -117.1625},
    zoom: 13
  });
}

google.maps.event.addDomListener(window, "load", initMap);
