require 'swagger_helper'

describe 'Products API' do

  path '/api/v1/products' do
    get 'Get products list' do
      tags 'Products'
      consumes 'application/json'

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

    get 'Retrieves a blog' do
      tags 'Products'
      produces 'application/json', 'application/xml'
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
          },
          required: [ 'id', 'name', 'category' ]

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