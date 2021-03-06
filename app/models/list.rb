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

  def self.current_user_lists(user_id)
    ids = UserList.where(user_id: user_id).pluck(:list_id)
    List.where(id: ids)
  end

  def self.daily_list(user_id)
    current_user_lists(user_id).where(type_of_list: 'Daily')
  end

  def daily_list?
    type_of_list.include? "Daily"
  end
end
