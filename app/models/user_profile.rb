class UserProfile < ApplicationRecord
  before_validation :set_default_membership, on: :create

  belongs_to :user
  belongs_to :membership
  has_one_attached :photo
  has_many :orders

  private

  def set_default_membership
    self.membership_id ||= Membership.find_by(name: "Basic").id
  end
end
