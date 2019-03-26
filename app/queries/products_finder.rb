class ProductsFinder
  def initialize(products)
    @products = products
  end

  def call(query_params)
    filtred_products = ProductsFilter.new(products).call(query_params)
  end

  private

  attr_accessor :products
end
