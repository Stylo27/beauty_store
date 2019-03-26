require 'swagger_helper'

describe 'Products API' do

  path '/api/v1/products' do
    get 'Get products list' do
      tags 'Products'
      consumes 'application/json'
      parameter name: 'filter[categories]',
                in: :query,
                type: :array,
                items: {
                  type: :string
                },
                explode: true
      parameter name: 'filter[price_from]',
                in:   :query,
                type: :integer
      parameter name: 'filter[price_to]',
                in:   :query,
                type: :integer
      parameter name: 'filter[under_sale]',
                in:   :query,
                type: :boolean
      parameter name: 'filter[available]',
                in:   :query,
                type: :boolean
      parameter name: 'sort[order_by_name]',
                in:   :query,
                type: :string
      parameter name: 'sort[order_by_category]',
                in:   :query,
                type: :string
      parameter name: 'sort[order_by_price]',
                in:   :query,
                type: :string
      parameter name: 'page',
                in:   :query,
                type: :integer
      parameter name: 'per_page',
                in:   :query,
                type: :integer

      response '200', 'ok' do
        schema type: :object,
        properties: {
          id:         { type: :integer },
          name:       { type: :string },
          sold_out:   { type: :boolean },
          category:   { type: :string },
          under_sale: { type: :boolean },
          price:      { type: :integer },
          sale_price: { type: :integer },
          sale_text:  { type: :string }
        }
        run_test!
      end
    end
  end

  path '/api/v1/products/{id}' do

    get 'Retrieves a product' do
      tags 'Products'
      produces 'application/json'
      parameter name: :id, :in => :path, :type => :string

      response '200', 'blog found' do
        schema type: :object,
          properties: {
            id:         { type: :integer },
            name:       { type: :string },
            sold_out:   { type: :boolean },
            category:   { type: :string },
            under_sale: { type: :boolean },
            price:      { type: :integer },
            sale_price: { type: :integer },
            sale_text:  { type: :string }
          }

        let(:id) { create(:product).id }
        run_test!
      end

      response '404', 'blog not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:'Accept') { 'application/foo' }
        run_test!
      end
    end
  end
end