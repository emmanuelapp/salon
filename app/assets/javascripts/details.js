function initMap() {
  var mapDiv = document.getElementById('map');
  var map = new google.maps.Map(mapDiv, {
      center: {lat: 42.6889132, lng: 23.3082176},
      zoom: 18
  });
}
