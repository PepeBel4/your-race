class Race2Serializer < ActiveModel::Serializer 

  attributes :id, :name, :scheduled_for, :started_at, :ongoingFor, :finished_at, :canceled_at

end