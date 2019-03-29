<template>
  <div>
    <b-card
      :title='product.attributes.name'
      :img-src="url + product.id"
      img-alt="Image"
      :sub-title="'Category: '+product.attributes.category"
      :footer="setPrice"
      style="max-width: 20rem;"
      class="mt-3"
    >
    </b-card>
  </div>
</template>

<script>
  export default {
    data() {
      return {
        url: 'https://picsum.photos/200/200?image='
      }
    },

    props: [
      'product'
    ],

    methods: {
      formatPrice: function(price) {
        return (price/100).toString()
      }
    },

    computed: {
      price: function() {
        return (this.product.attributes.price)
      },
      sold: function() {
        return this.product.attributes['sold-out']
      },
      setPrice: function() {
        if(this.sold) {
          return 'SOLD'
        }else if (this.product.attributes['under-sale']){
          return '$' + this.formatPrice(this.product.attributes['sale-price']) + ' (' + this.product.attributes['sale-text'] + ')'
        } else {
          return '$' + this.formatPrice(this.price)
        }
      },

    }
  }
</script>
