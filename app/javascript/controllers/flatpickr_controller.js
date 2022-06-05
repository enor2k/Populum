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
    let calendar = flatpickr(this.enddateTarget, {defaultDate: new Date().fp_incr(7)});
    calendar.toggle()
  }

  //  Refacto possible
}
