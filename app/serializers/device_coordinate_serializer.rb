class DeviceCoordinateSerializer < ActiveModel::Serializer
  attributes :id, :device_id, :timestamp, :latitude, :longitude
end
