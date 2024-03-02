class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :pet_profile
  has_one :review
end
