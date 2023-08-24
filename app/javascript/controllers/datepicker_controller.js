import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"

// Connects to data-controller="datepicker"
export default class extends Controller {
  connect() {
    console.log("App is live", this.element);

    flatpickr(this.element, {
      enableTime: true,
      // dateFormat: "Y-m-d H:i",
    })
  }
}
