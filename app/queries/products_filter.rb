class ProductsFilter
  def initialize(products)
    @products = products
  end

  def call(query_params)
    category_scoped = scope_category(products, query_params[:categories]&.split(','))
    price_scoped = scope_price(category_scoped, query_params[:price_from], query_params[:price_to])
    sale_scoped = scope_sale(price_scoped, query_params[:under_sale])
    available_scoped = scope_available(sale_scoped, query_params[:available])
  end

  private

  attr_accessor :products

  def scope_category(products, categories = nil)
    categories ? products.where("category ILIKE ANY ( array[?] )", categories) : products
  end

  def scope_price(products, price_from=nil, price_to=nil)
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
    available ? products.where(sold_out: !available) : products
  end
end
