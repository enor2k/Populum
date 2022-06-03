import { Controller } from "@hotwired/stimulus"
import { csrfToken } from "@rails/ujs"

export default class extends Controller {
  static targets = [ "form"]

  connect() {

  }

  send(event) {

    event.preventDefault()
    $('#SuggestsModal').modal('show');

    $('#submitSuggest').click(function() {
      $('#new_suggestion').submit();
    });
  }
}
