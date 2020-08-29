class Item < ApplicationRecord
  belongs_to :store
  has_many :inventories
  has_many :users, through: :inventories
end
