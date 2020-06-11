require 'rails_helper'

RSpec.describe Supplier, type: :model do

	context "ActiveRecord Associations" do
		it { should have_many(:outflows) }
	end

	context "validations" do
		it { should validate_presence_of(:name) }
		it { should validate_presence_of(:account_balance) }
		it { should validate_uniqueness_of(:name).case_insensitive }
	end

	context "Get_expenses method" do
		it "calculates the total quantity bought from a supplier" do
			# Helper for the 'get_operative_expenses' method in the Supply model.
			@supplier      = create(:supplier, name: "Supplier")
			@supply        = create(:supply, name: "Supply")
			@outflow       = create(:outflow)
			@outflow_item1 = create(:outflow_item, quantity: 5)
			@outflow_item2 = create(:outflow_item, quantity: 7)
			@outflow_item3 = create(:outflow_item, quantity: 3)

			@supplier.get_expenses(@supply.id, @supply.name) == {supply_name:"Supply", supplier_name: "Supplier", expenses: 15}
		end
	end

	context "Update_balance method" do
		it "calculates the new value for the account_balance attribute" do
			@supplier = create(:supplier, account_balance: 100)
			@outflow  = create(:outflow, paid: 150, total: 100)

			@supplier.update_balance(@outflow)

			@supplier.account_balance == 50
		end
	end

end
