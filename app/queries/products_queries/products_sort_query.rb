class ProductsQueries::ProductsSortQuery < BaseService
  def self.call(products, query_params, sort_by_sale: false)
    new(products, query_params, sort_by_sale).call
  end

  def initialize(products, query_params, sort_by_sale)
    super(products, query_params)
    @sort_by_sale = sort_by_sale
  end

  def call
    scoped_products = sort_by_name(
      products,
      validate_sort(query_params[:order_by_name])
    )
    scoped_products = sort_by_category(
      scoped_products,
      validate_sort(query_params[:order_by_category])
    )
    scoped_products = sort_by_price(
      scoped_products,
      validate_sort(query_params[:order_by_price]),
      sort_by_sale
    )
    scoped_products
  end

  private

  attr_reader :sort_by_sale

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

  def validate_sort(value)
    return 'asc' unless value != 'asc' || value != 'desc'
  end
end
