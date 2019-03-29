import HTTP from '../../../packs/http-interface.js';

export default {
  getProducts ({ commit, state }, payload) {
    HTTP
      .get('', {
        params: {
          per_page: state.perPage,
          page: payload !== undefined ? payload.page : state.currentPage,
          sort: payload !== undefined ? payload.sort : null,
          filter: payload !== undefined ? payload.filter : null
        }
      })
      .then(response => {
        for (var i = response.data['data'].length - 1; i >= 0; i--) {
          commit('pushProducts', response.data['data'])
        }
        commit('setLinks', response.data['links'])
        commit('setTotalCount', response.data['meta']['total-count'])
      })
    .catch(error => commit('pushErrors', error))
  },

  getProduct ({ commit }, payload) {
    HTTP
      .get(`/${payload}`)
      .then(response => {
        commit('setProduct', response.data['data'])
      })
      .catch(error => commit('pushErrors', error))
  }
};
