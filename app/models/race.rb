class Race < ApplicationRecord
  #model association
  belongs_to :fleet
  has_many :metrics, dependent: :destroy
  has_many :race_competitors
  has_many :race_scorings

  #validation
  validates_presence_of :race_type
end
