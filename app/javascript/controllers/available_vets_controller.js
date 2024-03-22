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
        const vetDiv = document.createElement('div');
        vetDiv.textContent = `HELLO ${vet.email}`;
        // Append default profile image
        vetDiv.innerHTML += `<img src="https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcR2v8jGQFEHwDE0bEIm2Sofs-0n5RUWyiNtY_JQw46IozVB-YPU" alt="Default Image">`;
        vetDiv.dataset.vet = vet.id; // Add a data attribute for identification
        vetList.appendChild(vetDiv);
      });
    })
    .catch(error => {
      console.error('Error fetching available vets:', error);
    });
  }

  selectVet(event) {
    const selectedVetIdInput = document.querySelector('#selected-vet-id');
    const vetDiv = event.target.closest('div[data-vet]');
    if (vetDiv) {
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
