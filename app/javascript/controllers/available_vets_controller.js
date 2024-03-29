import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["items", "date", "time"];

  connect() {
    const vetList = this.itemsTarget.querySelector('#vet-list');
    vetList.addEventListener('click', this.selectVet.bind(this));
  }

  update() {
    const date = this.dateTarget.value;
    const time = this.timeTarget.value;

    if (date && time) {
      this.fetchAvailableVets(date, time);
    }
  }

  fetchAvailableVets(date, time) {
    fetch(`/appointments/available_vets?date=${date}&time=${time}`, {
      method: "GET",
      headers: { "Accept": "application/json" }
    })
    .then(response => {
      if (!response.ok) {
        throw new Error('Network response was not ok');
      }
      return response.json();
    })
    .then(data => {
      const vets = data.vets;

      const vetList = this.itemsTarget.querySelector('#vet-list');
      vetList.innerHTML = '';

      vets.forEach(vet => {
        // Create card element
        const cardDiv = document.createElement('div');
        cardDiv.classList.add('card', 'col-sm-12');

        // Create flex container for vet image and name
        const flexContainer = document.createElement('div');
        flexContainer.classList.add('d-flex', 'align-items-center', 'justify-content-around');
        flexContainer.classList.add('flex-container');

        // Vet image
        const vetImage = document.createElement('img');
        vetImage.src = vet.profile_picture;
        vetImage.alt = 'Profile Picture';
        vetImage.classList.add('card-img-top', 'img-thumbnail', 'rounded-circle', 'col-sm-6', 'imgvetapp');

        // Vet name
        const vetName = document.createElement('h5');
        vetName.classList.add('card-title', 'text-center');
        vetName.textContent = `Dr. ${vet.full_name}`;
        vetName.style.color = "#2E6E62";

        // Append vet image and name to the flex container
        flexContainer.appendChild(vetImage);
        flexContainer.appendChild(vetName);

        // Append flex container to card body
        cardDiv.appendChild(flexContainer);

        // Create div for vet description
        const descriptionDiv = document.createElement('div');
        descriptionDiv.classList.add('col-sm-12', 'mt-3');

        // Vet description
        const vetDescription = document.createElement('p');
        vetDescription.textContent = vet.vet_description;
        vetDescription.classList.add('vet-description');

        // Append vet description to description div
        descriptionDiv.appendChild(vetDescription);

        // Append description div to card body
        cardDiv.appendChild(descriptionDiv);

        // Set data attribute for identification
        cardDiv.dataset.vet = vet.id;
        cardDiv.setAttribute('data-action', 'click->available-vets#selectVet');

        // Append card to vet list
        vetList.appendChild(cardDiv);
      });


    })
    .catch(error => {
      console.error('Error fetching available vets:', error);
    });
  }


  selectVet(event) {
    event.stopPropagation();
    const selectedVetIdInput = document.querySelector('#selected-vet-id');
    const vetDiv = event.target.closest('div[data-vet]');
    const allVetDivs = this.itemsTarget.querySelectorAll('div[data-vet]');

    if (vetDiv) {
      // Remove selected class from all vet divs
      allVetDivs.forEach(div => {
        div.classList.remove('selected');
      });

      // Add selected class to the clicked vet div
      vetDiv.classList.add('selected');

      // Set selected vet ID
      selectedVetIdInput.value = vetDiv.dataset.vet; // Use dataset to retrieve vet ID
    }
  }


  send(event) {
    event.preventDefault();
    const form = event.target;
    const formData = new FormData(form);

    fetch(form.action, {
      method: form.method,
      body: formData
    })
    .then(response => {
      if (!response.ok) {
        throw new Error('Network response was not ok');
      }
      // Handle successful form submission
      // Redirect to the appointments page
      window.location.href = '/appointments'; // Modify the URL as per your routes
    })
    .catch(error => {
      console.error('Error submitting form:', error);
    });
  }
}
