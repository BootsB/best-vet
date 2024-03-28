class Membership < ApplicationRecord
  has_many :user_profiles
  has_one_attached :photo
  monetize :price_cents
end
