class Metric < ApplicationRecord
  belongs_to :race
  has_many :finishes
end
