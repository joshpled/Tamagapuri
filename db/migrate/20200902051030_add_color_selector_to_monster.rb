class AddColorSelectorToMonster < ActiveRecord::Migration[6.0]
  def change
    add_column :monsters, :color, :integer, :default => 1
  end
end
