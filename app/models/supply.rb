class Supply < ApplicationRecord
	has_many :outflow_items
	has_many :outflows, through: :outflow_items
	has_many :suppliers, through: :outflows
	alias_attribute :items, :outflow_items
	validates :name, :price, :unit, :stock, presence: true
	validates :price, numericality: { greater_than: 0 }
	validates :name, uniqueness: { case_sensitive: false }

	def update_stock(quantity)
		value = self.stock + quantity
		self.update_attributes(stock: value)
	end

	def units_bought
		self.outflow_items.sum('quantity')
	end

# Calculates Cost of Goods Sold
	def cogs
		self.units_bought * self.price
	end
end