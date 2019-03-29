<template>
  <div>
    <b-card
      :title='product.attributes.name'
      :img-src="url + product.id"
      img-alt="Image"
      :sub-title="product.attributes.category"
      style="max-width: 20rem;"
      class="mt-3"
    >
    </b-card>
    {{ product.attributes.price }}
    {{ product.attributes['sold-out'] }}
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
    ]
  }
</script>
