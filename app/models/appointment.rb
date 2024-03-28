class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :pet_profile
  has_one :review
  has_one :user_profile, through: :user
  has_many :reviews

  delegate :first_name, :last_name, :address, :description, :membership, :location, :city, :phone_number, :state, :zip_code, :licence_number, to: :user_profile, allow_nil: true

  # Validations
  validates :appointment_date, presence: true
  validates :appointment_time, presence: true
  validates :status, presence: true
  validates :description_of_problem, presence: true
  validates :pet_profile, presence: true


  enum status: { pending: 0, accepted: 1, declined: 2, confirmed: 3 }


  def self.available_vets(date, time)
    vet_user = User.where(vet: true)

    available_vets = vet_user.select do |vet|
      vet.available_at?(date, time)
    end

    available_vets
  end


end
