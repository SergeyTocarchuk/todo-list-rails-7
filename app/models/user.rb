class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true
  validates :email, uniqueness: true

  has_many :user_lists, dependent: :destroy
  has_many :lists, through: :user_lists

  def find_day_of_week
    DateTime.now.strftime("%A")
  end

  def find_month
    DateTime.now.strftime("%B")
  end

  def find_date
    DateTime.now.strftime("%d")
  end

  def find_year
    DateTime.now.strftime("%Y")
  end
end
