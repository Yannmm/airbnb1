class AddInventoryCountToProducts < ActiveRecord::Migration[7.2]
  def change
    add_column :products, :inventory_count, :integer, default: 0, null: false
  end
end
