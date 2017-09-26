class RaceScoringSerializer < ActiveModel::Serializer
  attributes :id, :position, :points, :comments
  has_one :race_competitor
  has_one :race
end
