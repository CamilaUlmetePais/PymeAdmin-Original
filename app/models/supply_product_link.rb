class SupplyProductLink < ApplicationRecord
	validates :product_id, :supply_id, presence: true
	validates :product_id, uniqueness: true
	validates :supply_id, uniqueness: true
end