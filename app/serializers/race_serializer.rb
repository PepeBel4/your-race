class RaceSerializer < ActiveModel::Serializer
 
  attributes :id, :name
  has_many :metrics, serializer: MetricSerializer
  has_many :race_competitors, serializer: RaceCompetitorSerializer
  has_many :race_scorings

end