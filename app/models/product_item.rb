class ProductItem < ApplicationRecord
	belongs_to :inflow
	belongs_to :product
end
