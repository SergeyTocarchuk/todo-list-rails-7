class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :user_lists
  has_many :lists, through: :user_lists, dependent: :destroy
end
