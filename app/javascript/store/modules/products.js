import HTTP from '../../packs/http-interface.js';

const state = {
  all: [],
  currentPage: 1,
  perPage: 30,
  links: null,
  total_count: null,
  product: {},
  errors: []
};

const getters = {
  currentPage: state => state.currentPage
};

const mutations = {
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

const actions = {
  getProducts ({ commit }, payload) {
    HTTP
      .get('', {
        params: {
          per_page: state.perPage,
          page: payload !== undefined ? payload.page : state.currentPage
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
export default {
  state,
  mutations,
  getters,
  actions
}
