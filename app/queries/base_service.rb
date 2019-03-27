class BaseService
  def self.call(products, query_params)
    new(products, query_params).call
  end

  def initialize(products, query_params)
    @products = products
    @query_params = query_params
  end

  private

  attr_reader :products, :query_params
end
