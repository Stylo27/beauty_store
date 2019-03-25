class AddNullFalseAndDefaultValue < ActiveRecord::Migration[5.2]
  def change
    change_column_default :products, :sold_out, from: nil, to: false
    change_column_default :products, :under_sale, from: nil, to: false
    change_column_null :products, :sold_out, false
    change_column_null :products, :under_sale, false
  end
end
