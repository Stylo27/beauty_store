class Api::V1::ProductsController < Api::BaseController
  def index
    @products = Rails.cache.fetch(cached_key, expires_at: 1.hour) do
      @products = ProductsFinderQuery.call(Product.all, query_params)
        .paginate(page: params[:page], per_page: 30)
    end
    render json: @products, meta: pagination_dict(@products)
  end

  def show
    @product = Product.find(params[:id])
    render json: @product
  end

  def cached_key
    "#{params[:filter]}/#{params[:sort]}#{Product.maximum(:updated_at)}#{params[:page]}"
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
