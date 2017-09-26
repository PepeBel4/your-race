require 'rails_helper'

RSpec.describe Competition, type: :model do
  # Association test
  # ensure Competition model has a 1:m relationship with the Race model
  it { should have_many(:races).dependent(:destroy) }
  # Validation tests
  #ensure columns title, type and created_by are present before saving
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:created_by) }
end
