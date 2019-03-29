import Vue from 'vue'
import VueRouter from 'vue-router'
import ProductList from '../components/pages/product_list.vue'
import ProductShow from '../components/pages/product_show.vue'

Vue.use(VueRouter);

const routes = [
  { path: '/', component: ProductList },
  {
    path: '/products/:id',
    component: ProductShow,
    name: 'product_show'
  }
]

export default new VueRouter({
  routes
});
