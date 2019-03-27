import Vue from 'vue'
import App from '../app.vue'
import BootstrapVue from 'bootstrap-vue'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'

document.addEventListener('DOMContentLoaded', () => {
  Vue.use(BootstrapVue);
  var app = new Vue({
    el: '#app',
    render: h => h(App)
  })
})
