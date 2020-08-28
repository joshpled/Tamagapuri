class AddDefaultsToMonsters < ActiveRecord::Migration[6.0]
  def change
    change_column :monsters, :age, :integer, :default => 1
    change_column :monsters, :health, :integer, :default => 5
    change_column :monsters, :happiness, :integer, :default => 5
    change_column :monsters, :hunger, :integer, :default => 5
    change_column :monsters, :boredom, :integer, :default => 5
  end
end
