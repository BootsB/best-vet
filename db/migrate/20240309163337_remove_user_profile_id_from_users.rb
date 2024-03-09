class RemoveUserProfileIdFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :user_profile_id, :bigint
  end
end
