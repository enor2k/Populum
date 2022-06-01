import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["select", "choice", "long"]

  connect() {
    this.selected()
  }

  selected() {
    this.hideFields()
    switch (this.selectTarget.value) {
      case 'single_choice':
        this.choiceTarget.classList.remove('d-none')
        console.log('single')
        break;
      case 'multiple_choice':
        this.choiceTarget.classList.remove('d-none')
        console.log('multiple')
        break;
      case 'long_answer':
        this.longTarget.classList.remove('d-none')
        console.log('long')
        break;
    }
  }

  hideFields() {
    this.choiceTarget.classList.add('d-none')
    this.longTarget.classList.add('d-none')
  }
}
