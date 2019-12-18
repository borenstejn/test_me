class Flurbo < ApplicationRecord
  validates :owner, presence: true
end
