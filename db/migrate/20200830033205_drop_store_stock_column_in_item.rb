class DropStoreStockColumnInItem < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :store_stock
  end
end
