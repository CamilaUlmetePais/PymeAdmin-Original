require 'rails_helper'

RSpec.describe OutflowItem, type: :model do

	context "ActiveRecord associations" do
		it { should belong_to(:outflow).optional }
		it { should belong_to(:supply) }
	end

  context "validations" do
    it { should validate_presence_of (:quantity) }
    it { should validate_presence_of (:supply_id) }
    it { should validate_numericality_of(:quantity).is_greater_than(0)}
  end

  context "list method" do
    it "creates a concatenated string with its attributes for improved legibility" do
      @supply            = create(:supply, unit: "kg")
      @outflow           = create(:outflow)
      @outflow_item      = create(:outflow_item, quantity: 5)
      @outflow_item.list == "Test: 5kg"
    end
  end

  context "subtotal method" do
    it "calculates the subtotal for an outflow in process" do
      @supply                = create(:supply, price: 5)
      @outflow               = create(:outflow)
      @outflow_item          = create(:outflow_item, quantity: 5)
      @outflow_item.subtotal == 25
    end
  end

end