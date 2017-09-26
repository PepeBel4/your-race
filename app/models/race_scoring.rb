class RaceScoring < ApplicationRecord
  belongs_to :race_competitor
  belongs_to :race
end
