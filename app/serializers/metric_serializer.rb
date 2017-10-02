class MetricSerializer < ActiveModel::Serializer
  attributes :id, :name, :metric_type, :tracking_device, :currentCoordinate
  has_many :finishes, serializer: FinishSerializer
end
