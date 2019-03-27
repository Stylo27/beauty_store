<template>
  <div>
    <b-card v-for="(product, index) in products"
      :title="product.name"
      :img-src="url + index"
      img-alt="Image"
      :sub-title="product.category"
      style="max-width: 20rem;"
      class="mb-2"
    >
  </b-card>
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
