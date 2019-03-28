import HTTP from '../../packs/http-interface.js';
import axios from 'axios'
const state = {
  all: [],
  links: null,
  errors: []
};

const mutations = {
  pushProducts (state, payload) {
    state.all.push(payload)
  },
  pushLinks (state, payload) {
    state.links = payload
  },
  pushErrors (state, payload) {
    state.errors.push(payload)
  }
}
const actions = {
  getProducts ({ commit }) {
    HTTP
      .get()
      .then(response => {
        console.log(response.data['links'])
        for (var i = response.data['data'].length - 1; i >= 0; i--) {
          commit('pushProducts', response.data['data'][i]['attributes'])
        }
        commit('pushLinks', response.data['links'])
      })
    .catch(error => commit('pushErrors', error))
  }
};

export default {
  state,
  mutations,
  actions
}
