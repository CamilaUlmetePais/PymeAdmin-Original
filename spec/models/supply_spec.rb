require 'rails_helper'

RSpec.describe Supply, type: :model do

	context "ActiveRecord Associations" do
		it { should have_many(:outflow_items) }
	end

	context "Validations" do
		it { should validate_presence_of(:name) }
		it { should validate_presence_of(:price) }
		it { should validate_presence_of(:unit) }
		it { should validate_presence_of(:stock) }
		it { should validate_numericality_of(:price).is_greater_than(0) }
		it { should validate_uniqueness_of(:name).case_insensitive }
	end

	context "Cogs and units_bought methods" do
		it "calculates the cost of goods sold (COGS)" do
			@supply        = create(:supply, price: 2)
			@outflow       = create(:outflow)
			@outflow_item1 = create(:outflow_item, quantity: 5)
			@outflow_item2 = create(:outflow_item, quantity: 10)
			@outflow_item3 = create(:outflow_item, quantity: 6)

			@supply.units_bought == 21
			@supply.cogs         == 42
		end
	end

	context "Get_operative_expenses method" do
		xit "calculates the cost of operative expenses" do
			@supply.get_operative_expenses
		end
	end

	context "Update_stock method" do
		it "updates the 'stock' attribute" do
			@supply        = create(:supply, stock: 10)
			@outflow       = create(:outflow)
			@outflow_item1 = create(:outflow_item, quantity: 10)

			@supply.update_stock(@outflow_item1.quantity)
			@supply.stock == 20
		end
	end

end

=begin

	def get_operative_expenses
		self.suppliers.uniq.map{|supplier| supplier.get_expenses(self.id, self.name)}
	end

	def update_stock(quantity)
		value = self.stock + quantity
		self.update_attributes(stock: value)
	end

=end