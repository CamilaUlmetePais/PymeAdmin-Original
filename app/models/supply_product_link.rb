class SupplyProductLink < ApplicationRecord
	validates :product_id, :supply_id, presence: true

end