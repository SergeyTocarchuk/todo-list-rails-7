class Item < ApplicationRecord
  def completed?
    !is_completed.blank?
  end
end
