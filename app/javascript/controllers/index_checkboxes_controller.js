import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="index-checkboxes"
export default class extends Controller {

  static targets = [ "propertyCard"]

  setProjectList(event) {
    // Obtenir l'état de la case à cocher
    const isChecked = event.target.checked;
    // Obtenir l'ID de la propriété à partir de la valeur de la case à cocher
    const propertyId = event.target.value;
    // Sélectionner l'élément correspondant à la propriété
    const propertyCard = this.propertyCardTargets.find(card => card.id === `propertie-${propertyId}`);

    // Afficher ou cacher la carte en fonction de l'état de la case à cocher
    if (propertyCard) {
      if (isChecked) {
        propertyCard.classList.remove('d-none');
        propertyCard.classList.add('d-block');
      } else {
        propertyCard.classList.remove('d-block');
        propertyCard.classList.add('d-none');
      }
    }
  }
}
