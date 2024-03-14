import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"

// Connects to data-controller="pet-information-filter"
export default class extends Controller {
  static targets = ["button", "information", "appointment", "chosen", "reply"]
  static values = { info: String }

  select(event){
    const clickedButton = event.target.closest('.circle-item');
    const infoType = clickedButton.dataset.petInformationFilterInfoValue;
    if (clickedButton) {
      this.buttonTargets.forEach((button) => {
        button.classList.remove("pressed");
      });
      clickedButton.classList.add("pressed");
      }
      this.informationTargets.forEach((div) => {
        div.classList.add('d-none');
      });
      if (infoType) {
        const infoDiv = this.informationTargets.find((div) => div.dataset.petInformationFilterInfoValue === infoType);
        if (infoDiv) {
          infoDiv.classList.remove('d-none');
        };
      };
    };

    connect() {
      console.log(this.appointmentTarget)
      console.log(this.replyTarget)
      flatpickr(this.appointmentTarget,
        {
          enableTime: true,
          dateFormat: "Y-m-d H:i",
          onChange: this.dateSelected.bind(this)
      });
    }
    dateSelected(selectedDates, dateStr, instance) {
      this.chosenTarget.value = dateStr
    }

    message(event) {
      event.preventDefault();
      this.appointmentTarget.classList.add("d-none");
      this.replyTarget.innerHTML = "Appointment boooked 🎉! The information will be sent to your email.";
    }
}
