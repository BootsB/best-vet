class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :pet_profile
end
