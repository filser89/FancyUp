class Rental < ApplicationRecord
  CATEGORIES = ["suit", "pants", "tie", "shirt", "coat", "jacket", "sweater", "belt", "shoes"]
  OCCASIONS = ["formal", "cocktail", "casual", "black tie"]
  validates :name, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORIES }
  validates :occasion, presence: true, inclusion: { in: OCCASIONS }


  belongs_to :user
  has_many :orders
end
