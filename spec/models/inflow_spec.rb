require 'rails_helper'

RSpec.describe Inflow, type: :model do

	context "ActiveRecord Associations" do
		it { should have_many(:inflow_items) }
		it { should accept_nested_attributes_for(:inflow_items).allow_destroy(true) }
	end

	context "calidations" do
		it { should validate_presence_of(:total) }
	end

	context "generate_total method" do
		it "generates the value for the 'total' attribute by adding subtotals" do
			@product      = create(:product, price: 2)
			@inflow       = create(:inflow)
			@inflow_item1 = create(:inflow_item, quantity: 5)
			@inflow_item2 = create(:inflow_item, quantity: 3)
			@inflow_item3 = create(:inflow_item, quantity: 2)
			@inflow.generate_total
			@inflow.total == 20
		end
	end

	context "update_stocks method" do
		# This method takes one parameter, 'substract' (boolean).
		# When substract == true, stock is substracted (new inflow = less stock).
		# Otherwise, it's restored (deleted inflow = stock back to previous value).
		# This logic is determined in the model to avoid two very similar methods and improve controller legibility.

		it "substracts from products' stock when an inflow is created" do
			@product       = create(:product, stock: 10)
			@product.stock == 10

			@inflow        = create(:inflow)
			@inflow_item1  = create(:inflow_item, quantity: 5)
			@product.stock == 5
		end

		it "restores to products' stock when an inflow is deleted" do
			@product       = create(:product, stock: 10)
			@product.stock == 10

			@inflow        = create(:inflow)
			@inflow_item1  = create(:inflow_item, quantity: 5)
			@product.stock == 5

			@inflow.delete
			@product.stock == 10
		end
	end

end