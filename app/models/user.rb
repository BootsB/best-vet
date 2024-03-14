class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :pet_profiles
  has_many :appointments
  has_many :vet_appointments, class_name: "Appointment", foreign_key: "vet_id"
  has_many :pet_owner_appointments, class_name: "Appointment", foreign_key: "pet_owner_id"
  has_many :posts
  has_many :replies
  has_many :reviews, through: :appointments

  def non_vet?
    !vet
  end

  has_one :user_profile
  # Validations
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

end
