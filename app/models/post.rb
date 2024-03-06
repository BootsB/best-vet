class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :replies, dependent: :destroy

  # Validations
  validates :title, presence: true
  validates :content, presence: true
  validates :user_id, presence: true
  validates :category, presence: true
end
