class List < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy

  def date_formatted
    created_at.strftime("%d.%m.%Y")
  end

end
