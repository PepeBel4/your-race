class Metric < ApplicationRecord
  belongs_to :race
  has_many :coordinates
  has_many :finishes

  def currentCoordinate
  	self.coordinates.last()
  end

end
