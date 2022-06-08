import Chart from 'chart.js/auto';
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["chartone", "charttwo"]

  connect () {

  const ctx = this.chartoneTarget
  console.log(ctx)
  const myChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
      labels: [
        'Loisirs',
        'Urbanisme',
        'Securité',
      ],
      datasets: [{
          label: '# of Votes',
          data: [0, 10, 14, 13],
          backgroundColor: [
            '#ACD9D0',
            '#0F7373',
            '#F2E7DD',
          ],
          borderColor: [
            '#ffffff',
            '#ffffff',
            '#ffffff',
          ],
          borderWidth: 5
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

  const ctxtwo = this.charttwoTarget
  console.log(ctxtwo)
  const myCharttwo = new Chart(ctxtwo, {
  type: 'line',
  data: {
      labels: [
        'January',
        'February',
        'March',
        'April',
        'May',
        'June',
      ],
      datasets: [{
          label: '# of Votes',
          data: [0, 10, 5, 2, 20, 30, 45],
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

}
