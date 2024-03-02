class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :pet_profile
  has_one :review

  # Validations
  validates :appointment_date, presence: true
  validates :appointment_time, presence: true
  validates :status, presence: true
  validates :description_of_problem, presence: true
  validates :user_id, presence: true
  validates :pet_profile_id, presence: true
end
