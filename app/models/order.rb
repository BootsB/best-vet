class Order < ApplicationRecord
  belongs_to :user_profile
  belongs_to :membership
  monetize :amount_cents
end
