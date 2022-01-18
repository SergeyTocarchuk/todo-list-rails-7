class AddUserToUserList < ActiveRecord::Migration[7.0]
  def change
    add_reference :user_lists, :user, null: false, foreign_key: true
    add_reference :user_lists, :list, null: false, foreign_key: true
  end
end
