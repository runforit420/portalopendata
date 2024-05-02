/* eslint no-unused-vars: "off" */
/* global drawMap */

import { Turbo } from "@hotwired/turbo-rails";
import * as Controllers from "controllers";
import { map as LMap, tileLayer as LTileLayer, marker as LMarker } from "leaflet";

document.addEventListener('DOMContentLoaded', function() {
  var map = LMap('map').setView([46.182348004274196, 21.310986166846384], 13);

  LTileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
  }).addTo(map);

  // Load CSV file
  fetch('public/monumenteAradRomania.csv')
    .then(response => response.text())
    .then(data => {
      const rows = data.split('\n');
      rows.forEach(row => {
        const columns = row.split(',');
        const lat = columns[0];
        const lon = columns[1];
        const title = columns[2];

        // Add marker to map
        LMarker([lat, lon]).addTo(map)
          .bindPopup(title)
          .openPopup();
      });
    });
});