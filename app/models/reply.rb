class Reply < ApplicationRecord
  belongs_to :post
  belongs_to :user

  # Validations
  validates :content, presence: true
  validates :post_id, presence: true
  validates :user_id, presence: true
end
