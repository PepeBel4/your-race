class Group < ApplicationRecord
  belongs_to :competition
  has_many :fleets
  has_many :competitors
  has_many :scorings
end
