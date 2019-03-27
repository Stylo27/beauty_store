<template>
  <div>
    <Header></Header>
    <ProductList></ProductList>
  </div>
</template>

<script>
import Header from './components/layouts/header.vue'
import ProductList from './components/pages/product_list.vue'
export default {
  components: {
    Header, ProductList
  }
}
</script>
