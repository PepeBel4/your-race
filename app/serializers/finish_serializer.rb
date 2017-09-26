class FinishSerializer < ActiveModel::Serializer
  has_one :race_competitor
  has_one :metric
  attributes :id, :timestamp, :race_competitor, :number, :position

  def number
  	object.race_competitor.competitor.number
  end
end
