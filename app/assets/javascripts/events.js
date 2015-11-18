$( document ).ready(function() {
  var createLatitude = $("#event_latitude").val();
  var createLongitude = $("#event_longitude").val();
  var createLocation = new google.maps.LatLng(createLatitude,createLongitude);
  $("#event_location").geocomplete({
    map: "#create-map",
    mapOptions: { zoom: 10 },
    location: createLocation,
    markerOptions: {
      draggable: true
    }
  });

  var frontLocation = new google.maps.LatLng(32.715738,-117.1610838);
  $("#area-search-bar").geocomplete({

    map: "#front-map",
    mapOptions: { zoom: 10 },

    location: frontLocation,

    markerOptions: {
      draggable: true
    }
  });
});
