import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="select-recipient"
export default class extends Controller {
  static targets = ["recipient", "email", "membership"]

  createPetInformationString(pets) {
    const petInfoArray = pets.map((pet) => `${pet.name} (${pet.species})`);
    return petInfoArray.join(', ');
  }

  updateRecipientInformation(user, petInformationString) {
    this.recipientTarget.innerHTML =
      `<p class="subscribe-text"><strong> You will be sponsoring: </strong></p>
      <p class="subscribe-text"><i class="fa-solid fa-address-card"></i>: ${user.first_name} ${user.last_name}  </p>
      <p class="subscribe-text"><i class="fa-solid fa-earth-americas"></i>: ${user.city} - ${user.country} </p>
      <p class="subscribe-text"><i class="fa-solid fa-paw"></i>: ${petInformationString} </p>`;
  }

  select() {
    // get all data from User Model with Basic Membership
    const membershipId = this.membershipTarget.value;
    const url = `/subscribe?membership_id=${membershipId}`;
    const options = {
      method: "GET",
      headers: {
        "Accept": "application/json",
      }
    };
    fetch(url, options)
      .then(response => response.json())
      .then((data) => {
      // select instance that has selected email
        const email = (this.emailTarget.value)
        data.forEach((user) => {
          if (user.email === email){
            // add recipient information to DOM
            const petInformationString = this.createPetInformationString(user.pets);
            this.updateRecipientInformation(user, petInformationString);
          }
        });
      });
  };

  random(event){
    event.preventDefault();
    // get all data from User Model with Basic Membership
    const membershipId = this.membershipTarget.value;
    const url = `/subscribe?membership_id=${membershipId}`;
    const options = {
      method: "GET",
      headers: {
        "Accept": "application/json",
      }
    };
    fetch(url, options)
      .then(response => response.json())
      .then((data) => {
        // select random user
        const randomIndex = Math.floor(Math.random() * data.length);
        const randomItem = data[randomIndex];
        // add recipient information to DOM
        const petInformationString = this.createPetInformationString(randomItem.pets);
        this.updateRecipientInformation(randomItem, petInformationString);
      });
  }
};
