import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["btn0", "btn1", "btn2"]

  activate(event) {
    this.btn0Target.classList.remove('status-btn-active')
    this.btn1Target.classList.remove('status-btn-active')
    this.btn2Target.classList.remove('status-btn-active')
    event.target.classList.toggle('status-btn-active')

  }
}
