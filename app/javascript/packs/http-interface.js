import axios from 'axios';
import Qs from 'qs';

export default axios.create({
  baseURL: 'https://beauty-store.herokuapp.com/api/v1/products',
  paramsSerializer: params => Qs.stringify(params, {arrayFormat: 'brackets'})
})
