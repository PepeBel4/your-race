class CompetitorSerializer < ActiveModel::Serializer
  belongs_to :group
  has_many :race_competitors
  
  attributes :id, :number, :name, :country
end
