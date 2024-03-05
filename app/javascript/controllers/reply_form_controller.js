import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="reply-form"
export default class extends Controller {
  static targets = ["form", "button"];

  toggleForm(event) {
    event.preventDefault()
    this.formTarget.classList.toggle("d-none");
    
  }
}
