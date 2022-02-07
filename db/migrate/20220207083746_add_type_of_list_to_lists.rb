class AddTypeOfListToLists < ActiveRecord::Migration[7.0]
  def change
    add_column :lists, :type_of_list, :string
  end
end
