class CreateSlotMachines < ActiveRecord::Migration[6.0]
  def change
    create_table :slot_machines do |t|
      t.integer :slot_1
      t.integer :slot_2
      t.integer :slot_3

      t.timestamps
    end
  end
end
