import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "showZone"]

  focus(event) {

    let url = window.location.href;
    if (url.indexOf('?') > -1){
      url = url.match(/.*dashboard\?/)
      url += `&param=${event.currentTarget.dataset.id}`
    }else{
      url += `?&param=${event.currentTarget.dataset.id}`
    }
    window.location.href = url;
  }
}
