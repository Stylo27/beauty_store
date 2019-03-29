<template>
  <div>
    <b-pagination
      v-model="currentPage"
      :limit="3"
      :total-rows="rows"
      :per-page="perPage"
      aria-controls="my-table"
      align="right"
    ></b-pagination>
  </div>
</template>
<script>
  import { mapState } from 'vuex'
  export default {
    computed: {
      ...mapState ({
        rows: state => state.products.total_count,
        perPage: state => state.products.perPage
      }),
      currentPage: {
        get: function () {
          return this.$store.getters.currentPage
        },

        set: function (currentPage) {
          this.$store.dispatch('getProducts', {
            page: currentPage,
            sort: this.$route.query.sort,
            filter: this.$route.query.filter
          })
        }
      }
    }
  }
</script>
