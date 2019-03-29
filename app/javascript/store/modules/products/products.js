import actions from './actions'
import mutations from './mutations'
import * as getters from './getters'
const state = {
  all: [],
  currentPage: 1,
  perPage: 30,
  links: null,
  total_count: null,
  product: {},
  errors: []
};

export default {
  state,
  actions,
  mutations,
  getters
}
