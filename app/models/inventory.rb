class Inventory < ApplicationRecord
  belongs_to :item
  belongs_to :user

  def exist?
    
    if user.inventories.exists?(item_id: self.item_id) == false
      user.inventories << self
      user.rupees = user.rupees - self.item.price 
      user.rupees = self.rupees.clamp(0, 1000)
      user.save
      "#{Item.find_by_id(self.item.id).name.capitalize} Added to Your Inventory!"
    else
      item = user.inventories.find_by(item_id: self.item_id)
      item.quantity += 1
      item.save
      user.rupees = user.rupees - self.item.price
      user.rupees = self.rupees.clamp(0, 1000)
      user.save
      "+1 #{Item.find_by_id(item.id).name.capitalize}"
    end
  end


end
