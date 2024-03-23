import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()

console.log("Hello, Stimulus!");
export default class extends Controller {
  connect() {
    console.log("Hello, Stimulus!", this.element);

    flatpickr(this.element, {
    altInput: true,
    altFormat: "F j, Y",
    dateFormat: "Y-m-d",
    minDate: "today",
    defaultDate: "today",
    });
  };
}
