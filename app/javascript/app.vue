<template>
  <div>
    <Header></Header>
    <div class="row">
      <Sidebar></Sidebar>
      <router-view></router-view>
      <Pagination></Pagination>
    </div>
  </div>
</template>

<script>
  import Header from './components/layouts/header.vue'
  import Pagination from './components/layouts/pagination.vue'
  import Sidebar from './components/layouts/sidebar.vue'
  export default {
    components: {
      Header,
      Sidebar,
      Pagination
    }
  }
</script>
