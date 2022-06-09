import { Controller } from "stimulus"

export default class extends Controller {

  validate(event){
    event.currentTarget.submit()
    event.currentTarget.classList.add('d-none')
  }

}
