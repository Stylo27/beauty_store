class ProductSerializer < ActiveModel::Serializer
  attributes :id,
             :sold_out,
             :category,
             :under_sale,
             :price,
             :sale_price,
             :sale_text
end
