class DropQuantityOnStoreItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :quantity
    remove_column :inventories, :quantity
  end
end
