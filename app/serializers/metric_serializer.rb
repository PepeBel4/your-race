class MetricSerializer < ActiveModel::Serializer
  attributes :id, :name, :metric_order, :metric_type
  has_many :finishes, serializer: FinishSerializer
end
