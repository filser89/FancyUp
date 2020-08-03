class Order < ApplicationRecord
  STATUSES = ["pending", "confirmed", "canceled", "completed", "in progress"]
  validates :status, inclusion: {in: STAUSES}

  belongs_to :user
  belongs_to :rental
end
