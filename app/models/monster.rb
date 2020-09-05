class Monster < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  before_update :average_happiness

  def give_item_to_monster(params)
    inventory = Inventory.find_by_id(params[:monster][:inventory_id])
    case inventory.item.item_type
    when "food"
      self.hunger += inventory.item.effectiveness
      self.boredom -= 1
      inventory.quantity -= 1
      self.hunger = self.hunger.clamp(0, 5)
    when "medicine"
      self.health += inventory.item.effectiveness
      self.hunger -= 2
      inventory.quantity -= 1
      self.health = self.health.clamp(0, 5)
    when "toy"
      self.boredom += inventory.item.effectiveness
      self.hunger -= 1
      inventory.quantity -= 1
      self.boredom = self.boredom.clamp(0, 5)
    else
      nil
    end
    self.save
    inventory.save
    return true
  end

  def monster_age
  end

  private

  def average_happiness
    self.happiness = (self.health + self.hunger + self.boredom) / 3
  end
end
