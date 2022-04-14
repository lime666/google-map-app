function initDashboardMap() {
  if ($('#dashboard-map').length) {
    var DashboardMap = L.map('dashboard-map').setView([49.44827, 32.07474], 13);
    var marker = L.marker([49.44827, 32.07474]).addTo(DashboardMap);
    var popup = L.popup()
      .setLatLng([49.45827, 32.07474])
      .setContent("We're here!")
      .openOn(DashboardMap);

    L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}', {
      attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
      maxZoom: 18,
      id: 'mapbox/streets-v11',
      tileSize: 512,
      zoomOffset: -1,
      accessToken: 'pk.eyJ1IjoibGltZTY2NiIsImEiOiJjbDF2d2ZkbzAwMzFpM2JvOXd3Y2loazhnIn0.xkYyclf_LDl6G_Upt83X0g'
    }).addTo(DashboardMap);
  }
}


function initLocationMap() {
  if ($('#location-map').length) {
    var lat = $("#location-map").data("lat");
    var lng = $("#location-map").data("lng");
    var LocationMap = L.map('location-map').setView([lat, lng], 13);
    var marker1 = L.marker([lat, lng]).addTo(LocationMap);
    var popup1 = L.popup()
      .setLatLng([lat + 0.01, lng])
      .setContent("Hello!")
      .openOn(LocationMap);

    L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}', {
      attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
      maxZoom: 18,
      id: 'mapbox/streets-v11',
      tileSize: 512,
      zoomOffset: -1,
      accessToken: 'pk.eyJ1IjoibGltZTY2NiIsImEiOiJjbDF2d2ZkbzAwMzFpM2JvOXd3Y2loazhnIn0.xkYyclf_LDl6G_Upt83X0g'
    }).addTo(LocationMap);
  }
}


document.addEventListener("turbo:load", () => {
  initDashboardMap();
  initLocationMap();
});