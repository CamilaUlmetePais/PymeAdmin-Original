require 'rails_helper'

RSpec.describe InflowItem, type: :model do

	context "ActiveRecord Associations" do
		it { should belong_to(:inflow).optional }
		it { should belong_to(:product) }
	end

	context "Validations" do
		it { should validate_presence_of(:quantity) }
		it { should validate_presence_of(:product_id) }
		it { should validate_numericality_of(:quantity).is_greater_than(0)}
	end

	context "List method" do
		it "creates a concatenated string with its attributes for improved legibility" do
			@product          = create(:product, unit: "kg")
			@inflow           = create(:inflow)
			@inflow_item      = create(:inflow_item, quantity: 2)
			@inflow_item.list == "Test: 2kg"
		end
	end

	context "Subtotal method" do
		it "calculates the a partial subtotal for an inflow in process" do
			@product              = create(:product, price: 5)
			@inflow               = create(:inflow)
			@inflow_item          = create(:inflow_item, quantity: 5)
			@inflow_item.subtotal == 25
		end
	end

end