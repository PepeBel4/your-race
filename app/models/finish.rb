class Finish < ApplicationRecord
  belongs_to :race_competitor
  belongs_to :metric
end
