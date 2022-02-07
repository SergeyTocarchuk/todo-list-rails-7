class List < ApplicationRecord
  validates :type_of_list, presence: true

  has_many :items, dependent: :destroy
  has_one_attached :avatar

  has_many :user_lists, dependent: :destroy
  has_many :users, through: :user_lists

  def date_formatted
    created_at.strftime("%d.%m.%Y")
  end

  def completed?
    if items.completed.count > 0 && items.completed.count == items.count
      return true
    end
  end

  def self.daily_list
    where(type_of_list: 'daily')
  end
end
