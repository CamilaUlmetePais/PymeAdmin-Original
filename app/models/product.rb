class Product < ApplicationRecord
	has_many :inflow_items
	alias_attribute :items, :inflow_items
	validates :name, :price, :unit, presence: true
	validates :price, numericality: { greater_than: 0 }
	validates :name, uniqueness: { case_sensitive: false }
# deleted promotion_price validation for the time being

	def update_stock(quantity)
		value = self.stock + quantity
		self.update_attributes(stock: value)
	end

	def units_sold
		self.inflow_items.sum('quantity')
	end

	def sales_total
		self.units_sold * self.price
	end
end
