class GroupSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_one :competition
  has_many :competitors
  has_many :scorings
  has_many :fleets

  attribute :registrants

  def registrants 
  	object.competitors.size
  end

end
