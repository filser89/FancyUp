class User < ApplicationRecord
  validates :open_id, uniqueness: true

  has_many :orders, dependent: :destroy
  has_many :rentals, dependent: :destroy
  has_many :orders_as_owner, through: :rentals, source: :orders
end
