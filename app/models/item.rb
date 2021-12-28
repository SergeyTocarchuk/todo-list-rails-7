class Item < ApplicationRecord
  scope :completed, -> { where(is_completed: true) }
  scope :incompleted, -> { where(is_completed: nil) }

  def completed?
    is_completed.blank?
  end
end
