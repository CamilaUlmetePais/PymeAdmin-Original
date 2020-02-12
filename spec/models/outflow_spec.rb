require 'rails_helper'

RSpec.describe Outflow, type: :model do

	context "ActiveRecord Association" do
		it { should have_many(:outflow_items).dependent(:destroy) }
		it { should belong_to(:supplier) }
		it { should accept_nested_attributes_for(:outflow_items).allow_destroy(true) }
	end

	context "Validations" do
		it { should validate_presence_of(:total) }
		it { should validate_presence_of(:paid) }
		it { should validate_presence_of(:supplier_id) }
		it { should validate_numericality_of(:total).is_greater_than(0) }
	end

	context "Balance method" do
		it "Calculates the value to be parsed to Supplier.account_balance" do
			@outflow = create(:outflow, paid: 100, total: 120)
			@outflow.balance == -20
		end
	end

	context "Generate_total method" do
		it "Generates the value for the 'total' attribute by adding subtotals" do
			@supply        = create(:supply, price: 5)
			@outflow       = create(:outflow)
			@outflow_item1 = create(:outflow_item, quantity: 5)
			@outflow_item2 = create(:outflow_item, quantity: 3)
			@outflow_item3 = create(:outflow_item, quantity: 2)

			@outflow.generate_total
			@outflow.total == 50
		end
	end

	context "Update_stocks method" do
		it " " do
			# ???????????????
		end
	end

end

=begin
	def update_stocks
		self.items.each do |item|
			link_update(item)
		end
	end

	def link_update(outflow_item)
		link = SupplyProductLink.find_by(supply_id: item.supply.id)
		if link.nil?
			item.supply.update_stock(item.quantity)
		else
			Product.find(link.product_id).update_stock(item.quantity)
		end
	end

=end