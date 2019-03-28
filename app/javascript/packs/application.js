import Vue from 'vue'
import App from '../app.vue'
import BootstrapVue from 'bootstrap-vue'
import router from './router.js'
import store from '../store/index.js'

import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'

document.addEventListener('DOMContentLoaded', () => {
  Vue.use(BootstrapVue);
  var app = new Vue({
    el: '#app',
    store,
    router,
    render: h => h(App)
  })
})
