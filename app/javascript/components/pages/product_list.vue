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
  export default {
    data() {
      return {
        products: [],
        url: "https://picsum.photos/200/200/?image=",
      }
    },
    created() {
      fetch('http://localhost:3000/api/v1/products')
        .then((response) => {
          if(response.ok) {
            return response.json()
          }
        })
        .then((data) => {
          var products_data = data['data']
          for (var i = products_data.length - 1; i >= 0; i--) {
            this.products.push(products_data[i]['attributes'])
          }
        })
    }
  }
</script>
