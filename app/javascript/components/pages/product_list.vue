<template>
  <div class="col-md-8">
    <div class="row">
      <div class="col-md-3" v-for="product in products" :key="product.id">
        <router-link :to="{ name: 'product_show', params: { id: product.id } }">
          <Product :product="product" />
        </router-link>
      </div>
    </div>
    <Pagination />
  </div>
</template>
<script>
  import { mapState } from 'vuex';

  import Product from '../layouts/product.vue'
  import Pagination from '../layouts/pagination'

  export default {
    created() {
      this.$store.dispatch('getProducts', this.$route.query)
    },

    computed: mapState({
      products: state => state.products.all
    }),

    components: { Product, Pagination }
  }
</script>
