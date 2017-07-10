class Book < ApplicationRecord
  has_many :order_items
  validates :price, :title, :description, :length, :stock, presence: true
end
