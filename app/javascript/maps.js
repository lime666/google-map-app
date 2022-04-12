function initMap() {
  var map = L.map('map').setView([49.44827, 32.07474], 13);
  var marker = L.marker([49.44827, 32.07474]).addTo(map);
  var popup = L.popup()
    .setLatLng([49.45827, 32.07474])
    .setContent("We're here!")
    .openOn(map);

  L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}', {
    attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
    maxZoom: 18,
    id: 'mapbox/streets-v11',
    tileSize: 512,
    zoomOffset: -1,
    accessToken: 'pk.eyJ1IjoibGltZTY2NiIsImEiOiJjbDF2d2ZkbzAwMzFpM2JvOXd3Y2loazhnIn0.xkYyclf_LDl6G_Upt83X0g'
  }).addTo(map);
}


document.addEventListener("turbo:load", initMap())
