class ProductsFinderQuery
  def initialize(products)
    @products = products
  end

  def call(query_params)
    filtred_products = ProductsFilterQuery.new(products).call(query_params)
    ProductsSortQuery.new(filtred_products).call(query_params)
  end

  private

  attr_accessor :products
end
