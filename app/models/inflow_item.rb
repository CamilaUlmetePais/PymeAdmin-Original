class InflowItem < ApplicationRecord
	attr_accessor :quantity, :inflow_id, :product_id
	belongs_to :inflow, optional: true, inverse_of: :inflow_items
	belongs_to :product
	validates :quantity, :product_id, presence: true
	validates :quantity, numericality: { greater_than: 0 }
end
