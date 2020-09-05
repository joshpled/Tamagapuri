class Item < ApplicationRecord
  has_many :inventories
  has_many :users, through: :inventories

  validates :name, uniqueness: true
  validates :price, :item_type, :effectiveness, presence: true
  before_save { name.downcase! }

  scope :effectiveness_sort, -> { order(effectiveness: :asc) }
end
