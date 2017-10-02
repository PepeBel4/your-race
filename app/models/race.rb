class Race < ApplicationRecord

  include AASM

  aasm do
    state :announced, :initial => true
    state :scheduled

    event :schedule do
      transitions :from => :announced, :to => :scheduled, :after => Proc.new {|*args| set_scheduledFor(*args) }
    end
  end

  def set_scheduledFor(time)
  	p 'we are here'
  	self.scheduled_for = time
  end

  #model association
  belongs_to :fleet
  has_many :metrics, dependent: :destroy
  has_many :race_competitors
  has_many :race_scorings

  #validation
  validates_presence_of :race_type
end
