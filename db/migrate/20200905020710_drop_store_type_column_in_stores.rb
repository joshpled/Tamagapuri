class DropStoreTypeColumnInStores < ActiveRecord::Migration[6.0]
  def change
    remove_column :stores, :store_type
  end
end
