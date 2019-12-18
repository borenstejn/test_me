class Transaction < ApplicationRecord
  validates :owner, presence: true
end
