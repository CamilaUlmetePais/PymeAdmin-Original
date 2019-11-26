class ProductItem < ApplicationRecord
	belongs_to :inflow
	belongs_to :product
	validates :quantity, :product_id, presence: true
	validates :quantity, numericality: { greater_than: 0 }
end
