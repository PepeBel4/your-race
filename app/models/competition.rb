class Competition < ApplicationRecord
  		resourcify
		has_many :groups, dependent: :destroy
		validates_presence_of :title, :created_by
end
