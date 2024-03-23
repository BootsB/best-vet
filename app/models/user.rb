class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :pet_profiles
  has_many :appointments
  #has_many :appointments, through: :pet_profiles
  has_many :posts
  has_many :replies
  has_many :reviews, through: :appointments

  has_one :user_profile

  delegate :first_name, :last_name, :address, :description, :membership, :location, :city, :phone_number, :state, :zip_code, :licence_number,:profile_photo, to: :user_profile, allow_nil: true
  # Validations
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

# APPOINTMENT STATUS
  def available_at?(date, time)
    appointments.where(appointment_date: date, appointment_time: time).empty?
  end

  def full_name
    "#{user_profile&.first_name} #{user_profile&.last_name}"
  end

  # def email_with_picture_and_name
  #   if user_profile.present? && user_profile.photo.attached?
  #     avatar_url = Cloudinary::Utils.cloudinary_url(user_profile.photo.key, width: 45, height: 45, crop: :thumb, gravity: :face)
  #     "<img src='#{avatar_url}' class='avatar-img rounded-circle border' alt='#{email}' width='45' height='45'> #{full_name}".html_safe
  #   else
  #     default_avatar_url = "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"
  #     "<img src='#{default_avatar_url}' class='avatar-img rounded-circle border' alt='Default Profile Picture' width='45' height='45'> #{full_name}".html_safe
  #   end
  # end

end
