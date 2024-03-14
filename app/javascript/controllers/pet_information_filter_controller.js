import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="pet-information-filter"
export default class extends Controller {
  static targets = ["button", "information"]
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
}
