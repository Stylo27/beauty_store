<template>
  <div class='col-md-2'>
    <b-nav vertical>
      <b-nav-item>
        <router-link :to="{ path: '/', query: { sort: { order_by_name: toggleDesc } } }">
          <span @click="toggleParams">
            Sort by name
          </span>
        </router-link>
        <br>
        <router-link :to="{ path: '/', query: { sort: { order_by_category: toggleDesc } } }">
          <span @click="toggleParams">
            Sort by category
          </span>
        </router-link>
        <br>
        <router-link :to="{ path: '/', query: { sort: { order_by_price: toggleDesc } } }">
          <span @click="toggleParams">
            Sort by category
          </span>
        </router-link>
      </b-nav-item>
    </b-nav>
  </div>
</template>
<script>
  export default {
    data() {
      return {
        toggleDesc: 'desc'
      }
    },
    methods: {
      toggleParams: function () {
        this.toggleDesc = this.toggleDesc == 'desc' ? 'asc' : 'desc'
      }
    }
  }
</script>
