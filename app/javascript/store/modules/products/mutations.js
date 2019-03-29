export default {
  pushProducts (state, payload) {
    state.all = payload
  },
  setLinks (state, payload) {
    state.links = payload
  },
  setTotalCount (state, payload) {
    state.total_count = payload
  },
  pushErrors (state, payload) {
    state.errors.push(payload)
  },
  setCurrentPage (state, payload) {
    state.currentPage = payload
  },
  setProduct (state, payload) {
    state.product = payload
  }
};
