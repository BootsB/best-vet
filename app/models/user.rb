class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :pet_profiles
  has_many :appointments, through: :pet_profiles
  has_many :posts
  has_many :replies
  has_many :reviews, through: :appointments

  has_one :user_profile
  # Validations
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

end
