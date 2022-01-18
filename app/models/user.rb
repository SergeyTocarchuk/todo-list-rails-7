class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :user_lists, dependent: :destroy
  has_many :lists, through: :user_lists
end
