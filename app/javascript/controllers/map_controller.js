import { Controller } from "@hotwired/stimulus";
import mapboxgl from "mapbox-gl";

export default class extends Controller {
  static targets = ["map"]

  connect() {
    const apiKey = document.querySelector("meta[name='mapbox-api-key']").content;
    mapboxgl.accessToken = apiKey;

    this.map = new mapboxgl.Map({
      container: this.mapTarget.id,
      style: "mapbox://styles/mapbox/streets-v11",
      center: [2.3522, 48.8566],
      zoom: 12
    });

    this.addMarkers();
  }

  addMarkers() {
    const flats = JSON.parse(this.mapTarget.dataset.flats);
    flats.forEach(flat => {
      if (flat.latitude && flat.longitude) {
        const marker = new mapboxgl.Marker()
          .setLngLat([flat.longitude, flat.latitude])
          .setPopup(new mapboxgl.Popup().setHTML(`<h3>${flat.name}</h3><p>${flat.description}</p>`))
          .addTo(this.map);
      }
    });
  }
}
