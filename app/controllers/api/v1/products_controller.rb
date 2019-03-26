class Api::V1::ProductsController < Api::BaseController
  def index
    @products = ProductsFinder.new(Product.all).call(query_params)
    render json: @products
  end

  def show
    @product = Product.find(params[:id])
    render json: @product
  end

  def query_params
    params.permit(
      :categories,
      :price_from,
      :price_to,
      :under_sale,
      :available
    )
  end
end
