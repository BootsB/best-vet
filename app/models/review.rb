class Review < ApplicationRecord
  belongs_to :appointment

  # Validations
  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :content, presence: true
  validates :appointment_id, presence: true
end
