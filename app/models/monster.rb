class Monster < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  before_update :average_happiness

  scope :least_happy, -> { order(happiness: :asc)}

  def give_item_to_monster(params)
    inventory = Inventory.find_by_id(params[:monster][:inventory_id])
    case inventory.item.item_type
    when "food"
      self.update_properties({'hunger': inventory.item.effectiveness, 'boredom': -(rand(1..3))})
    when "medicine"
      self.update_properties({'health': inventory.item.effectiveness, 'hunger': -(rand(1..3))})
    when "toy"
      self.update_properties({'boredom': inventory.item.effectiveness, 'hunger': -(rand(1..3))})
    when "other"
      self.update_properties({'hunger': inventory.item.effectiveness, 'boredom': 0})
      self.update_properties({'health': inventory.item.effectiveness, 'boredom': 0})
      self.update_properties({'boredom': inventory.item.effectiveness, 'boredom': 0})
    else
      nil
    end
    inventory.quantity -= 1
    inventory.save
    return true
  end

  def update_properties(hash)
    self.update(hash.keys[0].to_s => (self.attributes[hash.keys[0].to_s] + hash.values[0]).clamp(0, 5), hash.keys[1].to_s => (self.attributes[hash.keys[1].to_s] + hash.values[1]).clamp(0, 5))
  end

  def happy?
    case self.happiness
    when 5
      "Great!"
    when 4
      "Alright"
    when 3
      "OK."
    else
      "not so well..."
    end
  end

  def monster_age
    self.age = (((Time.now - self.created_at.localtime)/1.hour)/24).round
    self.age = self.age.clamp(1,100)
    self.save
  end

  private

  def average_happiness
    self.happiness = (self.health + self.hunger + self.boredom) / 3
  end
  
end
