import { offset } from '@popperjs/core';
import Chart from 'chart.js/auto';
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["chart"]
  static values = { keys: Array, values: Array, type: String}

  connect () {
    if (this.typeValue === 'single_choice') {
      const ctx = this.chartTarget
      console.log(ctx)
      const myChart = new Chart(ctx, {
      type: 'doughnut',
      data: {
          labels: this.keysValue,
          datasets: [{
              label: '# of Votes',
              data: this.valuesValue,
              backgroundColor: [
                'rgba( 240, 231, 221, 0.8)',
                'rgba( 180, 215, 208, 0.8)',
                'rgba(52, 113, 114, 0.8)',
                'rgba(75, 192, 192, 0.8)',
                'rgba( 65, 138, 127, 0.8)',
                'rgba(255, 159, 64, 0.8)'
              ],
              borderColor: [
                'rgba( 240, 231, 221, 1)',
                'rgba( 180, 215, 208, 1)',
                'rgba(52, 113, 114, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba( 65, 138, 127, 1)',
                'rgba(255, 159, 64, 1)'
              ],
              borderWidth: 3
          }]
      },
      options: {
        scales: {
            y: {
                beginAtZero: true,
            }
        }
      }
      });
    }

    if (this.typeValue === 'multiple_choice') {
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
                'rgba( 240, 231, 221, 0.8)',
                'rgba( 180, 215, 208, 0.8)',
                'rgba(52, 113, 114, 0.8)',
                'rgba(75, 192, 192, 0.8)',
                'rgba( 65, 138, 127, 0.8)',
                'rgba(255, 159, 64, 0.8)'
              ],
              borderColor: [
                'rgba( 240, 231, 221, 1)',
                'rgba( 180, 215, 208, 1)',
                'rgba(52, 113, 114, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba( 65, 138, 127, 1)',
                'rgba(255, 159, 64, 1)'
              ],
              borderWidth: 3
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
}
