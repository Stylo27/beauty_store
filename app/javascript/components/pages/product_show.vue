<template>
  <div class="container">
    <Product :product="product" />
  </div>
</template>
<script>
  import { mapState } from 'vuex'
  import Product from '../layouts/product.vue'
  export default {
    computed: mapState({
      product: state => state.products.product
    }),
    beforeCreate() {
      this.$store.dispatch('getProduct', this.$route.params['id'])
    },
    components: { Product }
  }
</script>
