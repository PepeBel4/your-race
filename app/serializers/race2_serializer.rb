class Race2Serializer < ActiveModel::Serializer 

  belongs_to :fleet
  attributes :id, :name, :scheduled_for, :started_at, :ongoingFor, :finished_at, :canceled_at, :group, :aasm_state, :individual_recall

  def group
  	object.fleet.group
  end

end