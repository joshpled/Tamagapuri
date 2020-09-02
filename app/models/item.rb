class Item < ApplicationRecord
  belongs_to :store
  has_many :inventories
  has_many :users, through: :inventories
  validates :name, uniqueness: true
  validates :price, :item_type, :effectiveness, presence: true
  before_save { name.downcase! }

  def store_item(store)
    # byebug
    if store.items.include?(self)
      "#{self.name} already in Store"
    else
      store.items << self
      store.save
      "#{self.name} Added to Store!"
    end 
   
  end


  # def use_item
  #   case self.type
  #   when food
  #   when toy

  #   end
  # end

end