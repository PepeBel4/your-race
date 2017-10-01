class Sailor < ApplicationRecord
  belongs_to :competitor
  has_attached_file :avatar
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates :first_name, presence: true
end
