class Account < ApplicationRecord
  has_one :user
  has_many :orders
  validates :name, presence: true
end
