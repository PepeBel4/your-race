class FleetSerializer < ActiveModel::Serializer
  attributes :id, :name, :fleet_type
  has_one :group
  has_many :races
end
