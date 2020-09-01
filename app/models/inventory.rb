class Inventory < ApplicationRecord
  belongs_to :item
  belongs_to :user


  def verify_inventory
    byebug
  end

  def item_user_exists?
  end


end
