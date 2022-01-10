class Item < ApplicationRecord
  belongs_to :list  
  scope :completed, -> { where(is_completed: true) }
  scope :incompleted, -> { where(is_completed: [nil, false]) }
  has_many_attached :images

  def completed?
    !is_completed.blank?
  end

  def date_formatted
    created_at.strftime("%d.%m.%Y")
  end

end
