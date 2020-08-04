class Order < ApplicationRecord
  STATUSES = ["pending", "confirmed", "canceled", "completed", "in progress"]
  validates :status, inclusion: {in: STATUSES}

  belongs_to :user
  belongs_to :rental
end
