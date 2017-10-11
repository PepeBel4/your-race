class Race < ApplicationRecord

  resourcify

  def set_scheduledFor(time)
  	self.scheduled_for = time
  end

  def set_startedAt(time)
    self.started_at = time
  end

  def ongoingFor
    (Time.now - started_at).to_int if started_at
  end

  def inProgress?
    if ["in_progress", "individual_recall"].include?(self.aasm_state) 
      return true
    else return false
    end
  end

  #model association
  belongs_to :fleet
  has_many :metrics, dependent: :destroy
  has_many :race_competitors
  has_many :race_scorings

  #validation
  validates_presence_of :race_type
end
