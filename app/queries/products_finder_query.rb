class ProductsFinderQuery
  def initialize(products)
    @products = products
  end

  def call(query_params)
    scoped =
      if query_params[:filter]
        ProductsFilterQuery.new(products).call(query_params)
       else
        products
      end
    scoped =
      if query_params[:sort]
        ProductsSortQuery.new(scoped).call(query_params)
      else
        products
      end
      scoped
  end

  private

  attr_accessor :products
end
