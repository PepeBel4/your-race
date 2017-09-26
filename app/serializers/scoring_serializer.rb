class ScoringSerializer < ActiveModel::Serializer
  attributes :id, :competitor, :race_positions, :points, :discards, :points_with_discards
end
