class Post < ApplicationRecord
  belongs_to :user
  has_many :replies

  # Validations
  validates :title, presence: true
  validates :content, presence: true
  validates :user_id, presence: true
  validates :category, presence: true
  validates :subject, presence: true
end
