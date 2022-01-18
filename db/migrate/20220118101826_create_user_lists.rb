class CreateUserLists < ActiveRecord::Migration[7.0]
  def change
    create_table :user_lists do |t|

      t.timestamps
    end
  end
end
