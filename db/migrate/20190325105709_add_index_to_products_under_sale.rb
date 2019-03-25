class AddIndexToProductsUnderSale < ActiveRecord::Migration[5.2]
  def change
    add_index :products, :under_sale
  end
end
