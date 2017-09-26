require 'rails_helper'

RSpec.describe Race, type: :model do
  #Association test
  #ensure a Race record belongs to a single competition record
  it { should belong_to(:competition) }
  #Validation test
  #ensure column name is present before saving
  it { should validate_presence_of (:name) }
  it { should validate_presence_of(:race_type) }

end
