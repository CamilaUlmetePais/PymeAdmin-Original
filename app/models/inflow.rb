class Inflow < ApplicationRecord
	has_many :inflow_items
	accepts_nested_attributes_for :inflow_items, allow_destroy: true, reject_if: :all_blank
	alias_attribute :items, :inflow_items
	validates :total, presence: true

	def generate_total
		total = 0
		self.items.each do |item|
			total += item.subtotal
		end
		total
	end

	def restore_stock
		self.update_stocks(false)
	end

	def substract_stock
		self.update_stocks(true)
	end

	def update_stocks(substract)
		self.items.each do |item|
			if substract && !item.quantity.nil?
				value = -item.quantity
			else
				value = item.quantity
			end
			item.product.update_stock(value)
		end
	end
end


