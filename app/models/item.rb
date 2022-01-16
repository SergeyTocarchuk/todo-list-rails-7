class Item < ApplicationRecord
  belongs_to :list  
  scope :completed, -> { where(is_completed: true) }
  scope :incompleted, -> { where(is_completed: [nil, false]) }
  scope :low, -> { where(priority: 'low') }
  scope :middle, -> { where(priority: 'middle') }
  scope :high, -> { where(priority: 'high' ) }
  has_many_attached :images

  scope :filter_by_status, -> (status) { where is_completed: status }

  def completed?
    !is_completed.blank?
  end

  def priority_high?
    priority.include? "high"
  end

  def priority_low?
    priority.include? "low"
  end

  def date_formatted
    created_at.strftime("%d.%m.%Y")
  end

end
