class RaceSerializer < ActiveModel::Serializer
 
  attributes :id, :name, :scheduled_for, :started_at, :ongoingFor, :finished_at, :canceled_at, :aasm_state
  has_many :metrics, serializer: MetricSerializer
  has_many :race_competitors, serializer: RaceCompetitorSerializer
  has_many :race_scorings

end