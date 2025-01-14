import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tenants--popup-cliker"
export default class extends Controller {
  connect() {
    document.getElementById("model-pop").click();
  }
}
