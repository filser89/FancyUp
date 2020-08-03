class Rental < ApplicationRecord
  CATEGORIES = ["suit", "pants", "tie", "shirt", "coats and jackets", "sweaters and vests", "belts"]
  OCCASIONS = ["formal", "cocktail", "casual", "black tie"]
  validates :name, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORIES }
  validates :occasion, presence: true, inclusion: { in: OCCASIONS }


  belongs_to :user
  has_many :orders
end
