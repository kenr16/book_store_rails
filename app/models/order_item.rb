class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :book
  validates :quantity, presence: true
end
