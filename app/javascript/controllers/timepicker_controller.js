import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()

console.log("Hello, Stimulus!");
export default class extends Controller {
  connect() {
    console.log("Hello, Stimulus!", this.element);

    flatpickr(this.element, {
      enableTime: true,          // Enable time picker
      noCalendar: true,          // Disable calendar
      dateFormat: "H:i",         // Date format (hours:minutes)
      minuteIncrement: 15,       // Increment time by 15 minutes
      time_24hr: true            // Use 24-hour time format
  });

  }
}
