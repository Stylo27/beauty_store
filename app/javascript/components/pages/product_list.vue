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
  import axios from 'axios'
  export default {
    data() {
      return {
        products: [],
        url: "https://picsum.photos/200/200/?image=",
      }
    },
    created() {
      axios
        .get('http://localhost:3000/api/v1/products')
        .then(response => {
          var products_data = response.data['data']
          for (var i = products_data.length - 1; i >= 0; i--) {
            this.products.push(products_data[i]['attributes'])
          }
        })
        .catch(error => console.log(error));
    }
  }
</script>
