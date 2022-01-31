require 'rails_helper'

RSpec.describe Item, type: :model do

  describe "validations" do
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:is_completed) }
  end

  describe "associations" do
    it { should belong_to(:list) }
  end

  describe "Item" do
    describe "#completed?" do
      it "should return true if item is_completed" do
        item = Item.create(content: "Completed Item", is_completed: true)
        expect(item.completed?).to be true
      end
    end
  end

end
