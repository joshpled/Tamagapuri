class CreateMonsters < ActiveRecord::Migration[6.0]
  def change
    create_table :monsters do |t|
      t.string :name
      t.integer :age
      t.integer :health
      t.integer :happiness
      t.integer :hunger
      t.integer :boredom
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
