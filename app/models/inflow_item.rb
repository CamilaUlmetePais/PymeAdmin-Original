class InflowItem < ApplicationRecord
	belongs_to :inflow, optional: true
	belongs_to :product
	validates  :quantity, :product_id, presence: true
	validates  :quantity, numericality: { greater_than: 0 }

	def list
		self.product.name + ": " + self.quantity.to_s + self.product.unit.to_s
	end

	def subtotal
		self.quantity * self.product.price
	end

	def to_h
		attributes
	end

end