class RemoveCategoryFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :category, :string
  end
end
