<template>
  <div>
    <Header></Header>
    <div class="row">
      <Sidebar></Sidebar>
      <router-view :key="$route.fullPath"></router-view>

    </div>
  </div>
</template>

<script>
  import Header from './components/layouts/header.vue'
  import Sidebar from './components/layouts/sidebar.vue'
  export default {
    components: {
      Header,
      Sidebar
    }
  }
</script>
