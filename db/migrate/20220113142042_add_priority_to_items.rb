class AddPriorityToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :priority, :string, :default => 'medium'
  end
end
