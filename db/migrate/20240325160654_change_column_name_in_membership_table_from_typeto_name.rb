class ChangeColumnNameInMembershipTableFromTypetoName < ActiveRecord::Migration[7.0]
  def change
    rename_column :memberships, :type, :name
  end
end
