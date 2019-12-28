class InflowItem < ApplicationRecord
	belongs_to :inflow, optional: true
	belongs_to :product
	validates :quantity, :product_id, presence: true

	def subtotal
		self.quantity * self.product.price
	end

	def list
		self.product.name + " " + self.quantity.to_s + " / "
	end
end