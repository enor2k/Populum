import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["add_item", "template"]
  static values = { index: String }

  add_association(event) {
    event.preventDefault()
    var content = this.templateTarget.innerHTML.replace(new RegExp(this.indexValue, 'g'), new Date().getTime())
    this.add_itemTarget.insertAdjacentHTML('beforebegin', content)
  }

  remove_association(event) {
    event.preventDefault()
    let item = event.target.closest(".nested-fields")
    item.querySelector("input[name*='_destroy']").value = 1
    item.style.display = 'none'
  }
}
