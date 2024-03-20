class AddProfilePhotoToUserProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :user_profiles, :profile_photo, :string
  end
end
