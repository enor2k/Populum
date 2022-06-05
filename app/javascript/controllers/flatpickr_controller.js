import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["startdate", "enddate"]

  connect() {
  }

  startdatepick() {
    let calendar = flatpickr(this.startdateTarget, {minDate: "today"});
    calendar.toggle()
  }

  enddatepick() {
    let calendar = flatpickr(this.enddateTarget, {minDate: "today"});
    calendar.toggle()
  }

  //  Refacto possible
}
