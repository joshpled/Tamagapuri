class DefaultSlotMachineValues3 < ActiveRecord::Migration[6.0]
  def change
    change_column :slot_machines, :slot_1, :integer, :default => 4
    change_column :slot_machines, :slot_2, :integer, :default => 4
    change_column :slot_machines, :slot_3, :integer, :default => 4
  end
end
