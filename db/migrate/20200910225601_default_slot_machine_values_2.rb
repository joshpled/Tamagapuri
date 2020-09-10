class DefaultSlotMachineValues2 < ActiveRecord::Migration[6.0]
  def change
    change_column :slot_machines, :slot_1, :integer, :default => 5
    change_column :slot_machines, :slot_2, :integer, :default => 5
    change_column :slot_machines, :slot_3, :integer, :default => 5
  end
end
