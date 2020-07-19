require 'rails_helper'

RSpec.describe Outflow, type: :model do

	context "ActiveRecord association" do
		it { should have_many(:outflow_items).dependent(:destroy) }
		it { should belong_to(:supplier) }
		it { should accept_nested_attributes_for(:outflow_items).allow_destroy(true) }
	end

	context "validations" do
		it { should validate_presence_of(:total) }
		it { should validate_presence_of(:paid) }
		it { should validate_presence_of(:supplier_id) }
		it { should validate_numericality_of(:total).is_greater_than(0) }
	end

	context "add_stock and restore_stock methods" do
		it "updates a supply's stock when an outflow is created, edited or deleted" do
			@supply        = create(:supply, stock: 10)
			@outflow       = create(:outflow)
			@outflow_item1 = create(:outflow_item, quantity: 5)
			@outflow.add_stock
			@supply.stock == 15
			@outflow.restore_stock
			@outflow.destroy
			@supply.stock == 10
		end
	end

	context "generate_total method" do
		it "generates the value for the 'total' attribute by adding subtotals" do
			@supply        = create(:supply, price: 5)
			@outflow       = create(:outflow)
			@outflow_item1 = create(:outflow_item, quantity: 5)
			@outflow_item2 = create(:outflow_item, quantity: 3)
			@outflow_item3 = create(:outflow_item, quantity: 2)
			@outflow.generate_total
			@outflow.total == 50
		end
	end
end

