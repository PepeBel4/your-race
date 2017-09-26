class Fleet < ApplicationRecord
  belongs_to :group
  has_many :races
end
