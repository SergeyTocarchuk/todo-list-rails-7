class AddDefaultFalseToItemsForIsCompleted < ActiveRecord::Migration[7.0]
  def change
    change_column_default :items, :is_completed, from: nil, to: false
  end
end
