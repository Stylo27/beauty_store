<template>
  <div class='col-md-2'>
    <b-nav vertical>
      <span class="ml-1 mt-1">Sort:</span>
      <div>
        <b-nav-item>
          <router-link :to="{ path: '/', query: { ...this.$route.query, sort: { order_by_name: toggleDesc } } }">
            <span @click="toggleParams">
              By name
            </span>
          </router-link>
        </b-nav-item>
        <b-nav-item>
          <router-link :to="{ path: '/', query: { ...this.$route.query, sort: { order_by_category: toggleDesc } } }">
            <span @click="toggleParams">
              By category
            </span>
          </router-link>
        </b-nav-item>
        <b-nav-item>
          <router-link :to="{ path: '/', query: { ...this.$route.query, sort: { order_by_price: toggleDesc } } }">
            <span @click="toggleParams">
              By price
            </span>
          </router-link>
          <br>
        </b-nav-item>
      </div>
      <span class="ml-1">Filter:</span>
        <div>
          <b-nav-item>
            <input placeholder="Price from" v-model="priceFrom"/>
          </b-nav-item>
          <b-nav-item>
            <input placeholder="Price to" v-model="priceTo"/>
          </b-nav-item>
          <b-nav-item>
            <button @click="sendPriceValue">Ok</button>
          </b-nav-item>
        </div>
    </b-nav>
  </div>
</template>
<script>
  export default {
    data() {
      return {
        toggleDesc: 'desc',
        priceFrom: null,
        priceTo: null
      }
    },

    methods: {
      toggleParams: function () {
        this.toggleDesc = this.toggleDesc == 'desc' ? 'asc' : 'desc'
      },

      sendPriceValue: function() {
        this.$router.push({
          path: '/',
          query: {
            ...this.$route.query,
            filter: {
              price_from: this.priceFrom,
              price_to: this.priceTo
            }
          }
        })
      }
    }
  }
</script>
