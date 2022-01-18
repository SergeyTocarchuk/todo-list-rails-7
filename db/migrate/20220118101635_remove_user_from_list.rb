class RemoveUserFromList < ActiveRecord::Migration[7.0]
  def change
    remove_column :lists, :user_id
  end
end
