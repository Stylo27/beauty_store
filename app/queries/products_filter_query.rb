class ProductsFilterQuery < ProductsFinderQuery
  def call(query_params)
    filtred_products = scope_category(products, query_params[:categories]&.split(','))
    filtred_products = scope_price(filtred_products, query_params[:price_from], query_params[:price_to])
    filtred_products = scope_sale(filtred_products, query_params[:under_sale])
    filtred_products = scope_available(filtred_products, query_params[:available])
    filtred_products
  end

  private

  attr_accessor :products

  def scope_category(products, categories = nil)
    categories ? products.where('category ILIKE ANY ( array[?] )', categories) : products
  end

  def scope_price(products, price_from = nil, price_to = nil)
    if price_from && price_to
      products.where('price BETWEEN ? AND ?', price_from, price_to)
    elsif price_from
      products.where('price >= ?', price_from)
    elsif price_to
      products.where('price <= ?', price_to)
    else
      products
    end
  end

  def scope_sale(products, under_sale)
    under_sale ? products.where(under_sale: under_sale) : products
  end

  def scope_available(products, available)
    available ? products.where.not(sold_out: available) : products
  end
end
