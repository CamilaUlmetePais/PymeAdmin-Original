class InflowItem < ApplicationRecord
	belongs_to :inflow, optional: true
	belongs_to :product
	validates :quantity, :product_id, presence: true

	def subtotal
		self.quantity * self.price
	end
end