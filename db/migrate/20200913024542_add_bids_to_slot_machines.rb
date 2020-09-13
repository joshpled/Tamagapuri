class AddBidsToSlotMachines < ActiveRecord::Migration[6.0]
  def change
    add_column :slot_machines, :bid, :integer
  end
end
