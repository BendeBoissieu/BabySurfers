function autocomplete() {
  console.log('test');
  document.addEventListener("DOMContentLoaded", function() {
    var eventLocation = document.getElementById('gmaps-input-address');
    if (eventLocation) {
      var autocomplete = new google.maps.places.Autocomplete(eventLocation, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(eventLocation, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

autocomplete();
export { autocomplete };

