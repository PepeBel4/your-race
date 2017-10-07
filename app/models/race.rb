class Race < ApplicationRecord

  resourcify

  include AASM

  aasm do
    state :announced, :initial => true
    state :scheduled, :started, :postponed, :cancelled

    event :schedule do
      transitions :from => :announced, :to => :scheduled, :after => Proc.new {|*args| set_scheduledFor(*args) }
      transitions :from => :cancelled, :to => :scheduled, :after => Proc.new {|*args| set_scheduledFor(*args) }
    end

    event :start do
      transitions :from => :scheduled, :to => :started, :after => Proc.new {|*args| set_startedAt(*args) }
    end

    event :cancel do
      transitions :from => :started, :to => :cancelled
    end

  end

  def set_scheduledFor(time)
  	self.scheduled_for = time
  end

  def set_startedAt(time)
    self.started_at = time
  end

  def ongoingFor
    (Time.now - started_at).to_int if started_at
  end

  #model association
  belongs_to :fleet
  has_many :metrics, dependent: :destroy
  has_many :race_competitors
  has_many :race_scorings

  #validation
  validates_presence_of :race_type
end
