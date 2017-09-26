class Competitor < ApplicationRecord
  belongs_to :group
  has_many :race_competitors

  after_save :create_scoring

  def create_scoring
    @scoring = Scoring.new()
    @scoring.group = self.group
    @scoring.competitor = self
    @scoring.save!
  end

end
