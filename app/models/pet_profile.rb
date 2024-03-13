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
  validates :neutered, inclusion: [true, false]
  validates :microchip, inclusion: [true, false]
  validates :description, presence: true
  validates :gender, presence: true
end
