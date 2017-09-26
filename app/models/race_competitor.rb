class RaceCompetitor < ApplicationRecord
  belongs_to :competitor
  belongs_to :race

  after_save :create_scoring

  def create_scoring
    @race_scoring = RaceScoring.new()
    @race_scoring.race = self.race
    @race_scoring.race_competitor = self
    @race_scoring.save!
  end
end
