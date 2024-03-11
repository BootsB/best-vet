class PetProfile < ApplicationRecord
  belongs_to :user
  has_many :appointments

  # Validations
  validates :name, presence: true
  validates :species, presence: true
  validates :breed, presence: true
  validates :age, presence: true
  validates :weight, presence: true
  validates :user_id, presence: true
  validates :vaccinations, presence: true
  validates :neutered, presence: true
  validates :microchip, presence: true
  validates :description, presence: true
  validates :gender, presence: true
end
