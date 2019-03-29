class ProductsFilterQuery < BaseService
  def call
    scoped_products = scope_category(
      products,
      query_params[:categories]&.split(',')
    )
    scoped_products = scope_price(
      scoped_products,
      query_params[:price_from],
      query_params[:price_to]
    )
    scoped_products = scope_sale(
      scoped_products,
      query_params[:under_sale]
    )
    scoped_products = scope_available(
      scoped_products,
      query_params[:available]
    )
    scoped_products
  end

  private

  def scope_category(products, categories = nil)
    categories ? products.by_categories(categories) : products
  end

  def scope_price(products, price_from = nil, price_to = nil)
    if price_from.present? && price_to.present?
      products.price_range(price_from, price_to)
    elsif price_from.present?
      products.from_price(price_from)
    elsif price_to.present?
      products.to_price(price_to)
    else
      products
    end
  end

  def scope_sale(products, under_sale)
    under_sale.present? ? products.where(under_sale: under_sale) : products
  end

  def scope_available(products, available)
    available.present? ? products.where.not(sold_out: available) : products
  end
end
