require 'rails_helper'

RSpec.describe Api::V1::ProductsController, type: :controller do
  before(:all) do
    @products = create_list(:product, 5)
  end
  describe 'GET index' do
    before do
      get :index
    end
    it 'should return success status' do
      expect(response).to have_http_status(:success)
    end

    it 'should return products json' do
      json_response = JSON.parse(response.body)
      expect(json_response.size).to eq(5)
    end
  end

  describe 'GET show' do
    before do
      @product_id = @products.first.id
    end
    it 'should return a single product data' do
      get :show, params: { id: @product_id }
      expect(JSON.parse(response.body).keys).to match_array(
        [
          'id',
          'sold_out',
          'category',
          'under_sale',
          'price',
          'sale_price',
          'sale_text'
        ]
      )
    end
  end
end
