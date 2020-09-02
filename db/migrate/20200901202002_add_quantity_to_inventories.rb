class AddQuantityToInventories < ActiveRecord::Migration[6.0]
  def change
    add_column :inventories, :quantity, :integer, :default => 1
  end
end
