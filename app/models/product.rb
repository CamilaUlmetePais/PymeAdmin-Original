class Product < ApplicationRecord
	has_many :inflow_items, :outflow_items
	validates :name, :price, :promotion_price, :unit, presence: true
	validates :price, :promotion_price, numericality: { greater_than: 0 }
	validates :promotion_price, numericality: { less_than_or_equal_to: :price }
end
