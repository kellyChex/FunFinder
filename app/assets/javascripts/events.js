$( document ).ready(function() {
  var latitude = $("#event_latitude").val();
  var longitude = $("#event_longitude").val();
  var loc = new google.maps.LatLng(latitude,longitude);
  $("#event_location").geocomplete({
    map: "#map",
    mapOptions: {
      zoom: 10
    },

    location: loc,

    markerOptions: {
      draggable: true
    }
  });


  // var gmaps = new google.maps.places.Autocomplete($("#event_location").get(0),
  // { types: ['geocode'], componentRestrictions: {country: 'us'} });
  //
  // google.maps.event.addListener(gmaps, 'place_changed', function(){
  //
  //   var place = autocomplete.getPlace();
  //   $("#event_latitude").value = place.geometry.location.lat();
  //   $("#event_longitude").value = place.geometry.location.lng();
  // });
});
