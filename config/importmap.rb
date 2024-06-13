import "@hotwired/turbo-rails"
pin "@hotwired/turbo-rails", to: "turbo.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "leaflet", to: "leaflet/dist/leaflet.js", preload: true