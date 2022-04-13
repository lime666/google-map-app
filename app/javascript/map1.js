function initMap1() {
  var lat = $("#map-lat").data("lat");
  var lng = $("#map-lng").data("lng");
  console.log(lat)
  console.log(lng)
  var map1 = L.map('map1').setView([lat, lng], 13);
  var marker1 = L.marker([lat, lng]).addTo(map1);
  var popup1 = L.popup()
    .setLatLng([lat + 0.01, lng])
    .setContent("Hello!")
    .openOn(map1);

  L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}', {
    attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
    maxZoom: 18,
    id: 'mapbox/streets-v11',
    tileSize: 512,
    zoomOffset: -1,
    accessToken: 'pk.eyJ1IjoibGltZTY2NiIsImEiOiJjbDF2d2ZkbzAwMzFpM2JvOXd3Y2loazhnIn0.xkYyclf_LDl6G_Upt83X0g'
  }).addTo(map1);
}


document.addEventListener("turbo:load", initMap1())
