class Inflow < ApplicationRecord
	has_many :product_items
	validates :total, :cash, presence: true
end
