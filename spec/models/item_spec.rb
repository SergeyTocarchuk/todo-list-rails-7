require 'rails_helper'

RSpec.describe Item, type: :model do

  describe "validations" do
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:is_completed) }
  end

  describe "associations" do
    it { should belong_to(:list) }
  end

  # describe "class methods" do
  #   describe "::completed?" do
  #     it "should return true if item is_completed" do
  #       completed = Item.create(content: "Completed Item", is_completed: true)
  #       not_completed = Item.create(content: "Not completed Item", is_completed: false)
  #       expect(Item.completed?).to include(completed)
  #       expect(Item.completed?).not_to include(not_completed)
  #     end
  #   end
  # end

end
