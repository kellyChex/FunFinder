$( document ).ready(function() {
  $("#event_location").geocomplete();

  google.maps.event.addListener(autocomplete, 'place_changed', function(){
    alert("listen")
    var place = autocomplete.getPlace();
    $("#event_latitude").value = place.geometry.location.lat();
    $("#event_longitude").value = place.geometry.location.lng();
    alert(place.geometry.location.lng());
  });
});
