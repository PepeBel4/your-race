class CoordinateSerializer < ActiveModel::Serializer
  attributes :id, :timestamp, :latitude, :longitude
end
