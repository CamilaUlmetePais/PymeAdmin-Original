class InflowItem < ApplicationRecord
#	attr_accessible :quantity, :inflow_id, :product_id,
	belongs_to :inflow
	belongs_to :product
	validates :quantity, :product_id, presence: true
	validates :quantity, numericality: { greater_than: 0 }
end
