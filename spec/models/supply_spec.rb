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

end

=begin

def cogs
		self.units_bought * self.price
	end

	# Supply -> [{keys: supplier_id, value: quantity}]
	def get_operative_expenses
		self.suppliers.uniq.map{|supplier| supplier.get_expenses(self.id, self.name)}
	end

	def units_bought
		self.outflow_items.sum('quantity')
	end

	def update_stock(quantity)
		value = self.stock + quantity
		self.update_attributes(stock: value)
	end

=end