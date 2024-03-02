class Review < ApplicationRecord
  belongs_to :appointment

  # Validations
  validates :rating, presence: true
  validates :content, presence: true
  validates :appointment_id, presence: true
end
