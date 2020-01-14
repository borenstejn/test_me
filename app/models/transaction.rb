class Transaction < ApplicationRecord
  validates :owner,   presence: true
  validates :amount,  presence: true, numericality: { only_integer: true }
end
