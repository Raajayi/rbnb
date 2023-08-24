import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"

// Connects to data-controller="datepicker"
export default class extends Controller {
  static values = {
    availabilties: Array
  }

  static targets = ['startTime', 'endTime']

  connect() {

    flatpickr(this.startTimeTarget, {
      enableTime: true,
      minTime: "09:00",
      maxTime: "23:00",
      enable: this.availabiltiesValue
    })

    flatpickr(this.endTimeTarget, {
      enableTime: true,
      minTime: "09:00",
      maxTime: "23:00",
      enable: this.availabiltiesValue
    })
  }
}
