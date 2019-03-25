class Api::V1::ProductsController < Api::BaseController
  def index
    @products = Product.all
    render json: @products.to_json
  end
end
