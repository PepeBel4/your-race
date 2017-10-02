class CompetitorSerializer < ActiveModel::Serializer
  belongs_to :group
  has_many :race_competitors
  has_one :sailor
  
  attributes :id, :number, :name, :country
end
