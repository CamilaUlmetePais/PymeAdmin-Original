class Inflow < ApplicationRecord
	has_many :inflow_items
	accepts_nested_attributes_for :inflow_items
	alias_attribute :items, :inflow_items
	validates :total, presence: true

	def generate_total
		total = 0
		self.items.each do |item|
			total += item.subtotal
		end
		total
	end

	def update_stocks
		self.items.each do |item|
			value = item.quantity * -1
			item.product.update_stock(value)
		end
	end
end

