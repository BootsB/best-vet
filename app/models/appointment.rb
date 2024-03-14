class Appointment < ApplicationRecord
  belongs_to :vet, class_name: "User"
  belongs_to :pet_owner, class_name: "User"
  belongs_to :pet_profile
  has_one :review

  # Validations
  validates :appointment_date, presence: true
  validates :appointment_time, presence: true
  validates :status, presence: true
  validates :description_of_problem, presence: true

  enum status: { Requested: 0, Accepted: 1, Declined: 2, Confirmed: 3 }

  # Scopes
  def pending?
    status == "Requested"
  end

  def accepted?
    status == "Accepted"
  end

  def declined?
    status == "Declined"
  end

  def confirmed?
    status == "Confirmed"
  end
end
