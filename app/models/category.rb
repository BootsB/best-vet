class Category < ApplicationRecord
  has_many :posts
  has_one_attached :photo
end
