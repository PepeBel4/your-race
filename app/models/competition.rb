class Competition < ApplicationRecord
		resourcify

		#model association
		has_many :groups, dependent: :destroy
		
		#validations
		validates_presence_of :title, :created_by
end
