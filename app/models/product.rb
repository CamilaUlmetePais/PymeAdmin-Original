class Product < ApplicationRecord
	has_many :inflow_items
	has_many :outflow_items
	validates :name, :price, :unit, presence: true
	validates :price, numericality: { greater_than: 0 }
# deleted promotion_price validation for the time being

	def update_stock(quantity)
		value = self.stock + quantity
		self.update_attributes(stock: value)
	end
end
