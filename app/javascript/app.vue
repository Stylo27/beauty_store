<template>
  <div>
    <Header></Header>
    <div class="row">
      <Sidebar></Sidebar>
      <ProductList></ProductList>
    </div>
  </div>
</template>

<script>
  import Header from './components/layouts/header.vue'
  import ProductList from './components/pages/product_list.vue'
  import Sidebar from './components/layouts/sidebar.vue'
  export default {
    components: {
      Header,
      ProductList,
      Sidebar
    }
  }
</script>
