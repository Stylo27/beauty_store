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
            <b-form-input placeholder="Write categories comma separated" v-model="categories"/>
          </b-nav-item>
          <b-nav-item>
            <b-form-input placeholder="Price from" v-model="priceFrom"/>
          </b-nav-item>
          <b-nav-item>
            <b-form-input placeholder="Price to" v-model="priceTo"/>
          </b-nav-item>
          <b-nav-item>
            <b-form-select v-model="available" :options="available_options" />
          </b-nav-item>
          <b-nav-item>
            <b-form-select v-model="under_sale" :options="sale_options" />
          </b-nav-item>
          <b-nav-item>
            <button @click="sendFileterValues" class="btn btn-primary">Send filter</button>
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
        priceTo: null,
        available: null,
        under_sale: null,
        categories: null,
        sale_options: [
          { value: null, text: 'Choose Under sale' },
          { value: true, text: 'Under sale' },
          { value: false, text: 'Without sale' }
        ],
        available_options: [
          { value: null, text: 'Choose Available/Unavailable' },
          { value: true, text: 'Available' },
          { value: false, text: 'Unavailable' }
        ]
      }
    },

    methods: {
      toggleParams: function () {
        this.toggleDesc = this.toggleDesc == 'desc' ? 'asc' : 'desc'
      },

      sendFileterValues: function() {
        this.$router.push({
          path: '/',
          query: {
            ...this.$route.query,
            filter: {
              price_from: this.priceFrom,
              price_to: this.priceTo,
              available: this.available,
              under_sale: this.under_sale,
              categories: this.categories
            }
          }
        })
      }
    }
  }
</script>
