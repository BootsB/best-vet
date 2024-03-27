class RemoveMembershipColumnFromUserProfile < ActiveRecord::Migration[7.0]
  def change
    remove_column :user_profiles, :membership
    add_reference :user_profiles, :memberships, null: false, foreign_key: true
  end
end
