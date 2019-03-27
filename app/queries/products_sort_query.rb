class ProductsSortQuery < ProductsFinderQuery
  def call(query_params)
    sorted_products = sort_by_name(
      products,
      query_params[:sort][:order_by_name]
    )
    sorted_products = sort_by_category(
      sorted_products,
      query_params[:sort][:order_by_category]
    )
    sorted_products = sort_by_price(
      sorted_products,
      query_params[:sort][:order_by_price],
      query_params[:filter]&[:under_sale]
    )
  end

  private

  attr_accessor :products

  def sort_by_name(products, order_by_name = nil)
    order_by_name ? products.order(name: order_by_name) : products
  end

  def sort_by_category(products, order_by_category = nil)
    order_by_category ? products.order(category: order_by_category) : products
  end

  def sort_by_price(products, order_by_price = nil, under_sale = nil)
    if order_by_price && under_sale
      products.order(sold_out: :asc, sale_price: order_by_price)
    elsif order_by_price
      products.order(sold_out: :asc, price: order_by_price)
    else
      products
    end
  end
end
