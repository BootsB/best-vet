import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-card"
export default class extends Controller {
  static targets = ["vets", "records", "forum", "textForum", "textVets", "textRecords"];

  toggleVets(event) {
    event.preventDefault();
    this.textVetsTarget.classList.toggle('d-none');
    this.vetsTarget.classList.toggle('d-none');
  }
  toggleForum(event) {
    event.preventDefault();
    this.textForumTarget.classList.toggle('d-none');
    this.forumTarget.classList.toggle('d-none');
  }
  toggleRecords(event) {
    event.preventDefault();
    this.textRecordsTarget.classList.toggle('d-none');
    this.recordsTarget.classList.toggle('d-none');
  }

}
