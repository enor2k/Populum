import Chart from 'chart.js/auto';
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["chart"]
  static values = { keys: Array, values: Array}

  connect () {
    console.log("hello from display controller")
    console.log(this.keysValue)
    console.log(this.valuesValue)
    const ctx = this.chartTarget
    console.log(ctx)
    const myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: this.keysValue,
        datasets: [{
            label: '# of Votes',
            data: this.valuesValue,
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
      scales: {
          y: {
              beginAtZero: true
          }
      }
    }
    });
  }
}
