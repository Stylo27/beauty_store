<template>
  <div class="col-md-9">
    <div class="row">
      <div class="col-md-3" v-for="(product, index) in products">
        <b-card
          :title="product.name"
          :img-src="url + index"
          img-alt="Image"
          :sub-title="product.category"
          style="max-width: 20rem;"
          class="mt-3"
        >
        </b-card>
      </div>
    </div>
  </div>
</template>
<script>
  import { mapState } from 'vuex';
  export default {
    computed: mapState({
      products: state => state.products.all
    }),
    data() {
      return {
        url: 'https://picsum.photos/200/200?image='
      }
    },
    created() {
      this.$store.dispatch('getProducts')
    }
  }
</script>
