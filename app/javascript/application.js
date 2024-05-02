// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "controllers";
import L from "leaflet";
= require leaflet

console.log('hello from app/javascript/application.js')
document.addEventListener('DOMContentLoaded', function() {
  var map = L.map('map').setView([46.182348004274196, 21.310986166846384], 13);

  L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
  }).addTo(map);

  // Load CSV file
  fetch('public/monumenteAradRomania.csv')
    .then(response => response.text())
    .then(data => {
      const rows = data.split('\n');
      rows.forEach(row => {
        const columns = row.split(',');
        const lat = columns[3];
        const lon = columns[4];
        const title = columns[1];

        // Add marker to map
        L.marker([lat, lon]).addTo(map)
          .bindPopup(title)
          .openPopup();
      });
    });
});
