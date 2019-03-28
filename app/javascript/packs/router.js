import Vue from 'vue'
import VueRouter from 'vue-router'
import ProductList from '../components/pages/product_list.vue'

Vue.use(VueRouter);

const routes = [
  { path: '/', component: ProductList }
]

export default new VueRouter({
  routes
});
