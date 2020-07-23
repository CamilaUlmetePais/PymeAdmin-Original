class Product < ApplicationRecord
	has_many        :inflow_items
	alias_attribute :items, :inflow_items
	validates       :name, :price, :unit, presence: true
	validates				:stock, :notification_threshold, numericality: true
	validates       :price, numericality: { greater_than: 0 }
	validates       :name, uniqueness: { case_sensitive: false }

	def notification?
		self.stock <= self.notification_threshold
	end

	def units_sold
		self.inflow_items.sum('quantity')
	end

	def update_stock(quantity)
		value = self.stock + quantity
		self.update_attributes(stock: value)
	end

	def sales_total
		self.units_sold * self.price
	end
end
