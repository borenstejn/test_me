class Transaction < ApplicationRecord
  validates :user,   presence: true
  validates :amount,  presence: true, numericality: { only_integer: true }

  belongs_to :user
end
