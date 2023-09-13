class ChangeQuantityDataTypeInFoodsTable < ActiveRecord::Migration[7.0]
  def change
    change_column :foods, :quantity, :decimal, using: 'quantity::decimal'
  end
end
