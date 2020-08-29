class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :price
      t.integer :store_stock
      t.string :item_type
      t.integer :effectiveness
      t.references :store, null: false, foreign_key: true

      t.timestamps
    end
  end
end
