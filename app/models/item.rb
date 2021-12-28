class Item < ApplicationRecord
  belongs_to :user, foreign_key: "user_id"
  
  scope :completed, -> { where(is_completed: true) }
  scope :incompleted, -> { where(is_completed: nil) }

  def completed?
    is_completed.blank?
  end
end
