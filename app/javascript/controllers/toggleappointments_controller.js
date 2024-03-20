import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "toggleableElement", "toggleableText" ]

  fire(event) {
    event.preventDefault(); // Prevent default link behavior
    this.toggleableElementTarget.classList.toggle("d-none");
    const isVisible = !this.toggleableElementTarget.classList.contains("d-none");
    const licenceNumber = this.element.dataset.licenceNumber; // Access licence number from data attribute
    this.toggleableTextTarget.textContent = isVisible ? licenceNumber : "See Vet Licence Number";
  }
}
