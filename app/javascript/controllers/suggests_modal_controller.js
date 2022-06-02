import { Controller } from "@hotwired/stimulus"
import { csrfToken } from "@rails/ujs"

export default class extends Controller {
  static targets = [ "form"]

  connect() {

  }

  send(event) {

    event.preventDefault()
    $('#SuggestsModal').modal('show');
    $('#new_suggestion').delay(5000).submit();
  }
}
