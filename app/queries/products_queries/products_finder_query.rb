class ProductsQueries::ProductsFinderQuery < BaseService
  def call
    found_products = filter_params ? filter_products(products) : products
    found_products = sort_params ? sort_products(found_products) : found_products
    found_products
  end

  private

  def filter_products(products)
    ProductsQueries::ProductsFilterQuery.call(products, filter_params)
  end

  def sort_products(products)
    ProductsQueries::ProductsSortQuery.call(products, sort_params, sort_by_sale: sort_by_sale?)
  end

  def filter_params
    @filter_params ||= query_params[:filter]
  end

  def sort_params
    @sort_params ||= query_params[:sort]
  end

  def sort_by_sale?
    query_params.dig(:filter, :under_sale) == 'true'
  end
end
