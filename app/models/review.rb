class Review < ApplicationRecord
  belongs_to :appointment

  # Validations
  validates :rating, presence: true
  validates :content, presence: true
end
