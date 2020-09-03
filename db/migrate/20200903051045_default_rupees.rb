class DefaultRupees < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :rupees, :integer, :default => 100
  end
end
