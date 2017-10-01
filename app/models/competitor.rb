class Competitor < ApplicationRecord
  belongs_to :group
  has_many :race_competitors
  has_one :sailor

  after_save :create_scoring
  after_save :fetch_sailor_data

  def create_scoring
    @scoring = Scoring.new()
    @scoring.group = self.group
    @scoring.competitor = self
    @scoring.save!
  end

  private

  def fetch_sailor_data
    SailorFetchJob.perform_later(id)
  end

end
