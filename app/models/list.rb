class List < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy
  has_one_attached :avatar

  def date_formatted
    created_at.strftime("%d.%m.%Y")
  end

  def completed?
    if items.completed.count == items.count
      return true
    end
  end

end
