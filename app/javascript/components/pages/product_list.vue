<template>
  <div class="col-md-8">
    <div class="row">
      <div class="col-md-3" v-for="product in products" :key="product.id">
        <Product :product="product" />
      </div>
    </div>
  </div>
</template>
<script>
  import { mapState } from 'vuex';
  import Product from './product.vue'
  export default {
    computed: mapState({
      products: state => state.products.all
    }),
    created() {
      this.$store.dispatch('getProducts')
    },
    components: { Product }
  }
</script>
