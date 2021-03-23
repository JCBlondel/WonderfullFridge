import Vue from 'vue/dist/vue.esm'
import Fridge from './components/fridge'

document.addEventListener('DOMContentLoaded', () => {
  new Vue({
    el: '#app',
    components: {
      'fridge' : Fridge,
    },
  })
})
