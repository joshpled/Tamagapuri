class DropStoreIdColumnInItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :store_id
  end
end
