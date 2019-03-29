<template>
  <div class="container">
    <Product v-if='product.attributes' :product="product" />
  </div>
</template>
<script>
  import { mapState } from 'vuex'
  import Product from '../layouts/product.vue'

  export default {
    components: {
      Product
    },

    beforeCreate() {
      this.$store.dispatch('getProduct', this.$route.params['id'])
    },

    computed: mapState({
      product: state => state.products.product
    })
  }
</script>
