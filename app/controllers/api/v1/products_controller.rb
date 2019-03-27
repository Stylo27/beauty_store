class Api::V1::ProductsController < Api::BaseController
  def index
    cached_key = "#{params[:filter]}/#{params[:sort]}#{Product.maximum(:updated_at)}"
    @products = Rails.cache.fetch("#{cached_key}", expires_at: 1.hour) do
      ProductsFinderQuery.new(Product.all).call(query_params)
        .paginate(page: params[:page], per_page: params[:per_page])
    end
    render json: @products
  end

  def show
    @product = Product.find(params[:id])
    render json: @product
  end

  def query_params
    params.permit(
      filter: [
        :categories,
        :price_from,
        :price_to,
        :under_sale,
        :available
      ],
      sort: [
        :order_by_name,
        :order_by_category,
        :order_by_price
      ]
    )
  end
end
