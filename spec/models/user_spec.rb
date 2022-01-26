require 'rails_helper'

RSpec.describe User, type: :model do

  describe "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:admin) }
    it { should validate_uniqueness_of(:email).case_insensitive }
  end

  describe "associations" do
    it { should have_many(:user_lists) }
    it { should have_many(:lists).through(:user_lists) } 
  end

end
