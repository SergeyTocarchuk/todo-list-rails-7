class UserList < ApplicationRecord
  belongs_to :user
  belongs_to :list

  def self.sharable_user_ids(list_id)
    ids = UserList.where(list_id: list_id).pluck(:user_id)
    User.where.not(id: ids)
  end
end
