class Flurbo < ApplicationRecord
  validates :user, presence: true
  validates :balance, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :user

  DEFAULT_BALANCE = 1_000_00
end
