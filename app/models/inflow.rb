class Inflow < ApplicationRecord
	#attr_accessor :cash, :inflow_items_attributes
	#validates :total, :cash, presence: true
	has_many :inflow_items
	accepts_nested_attributes_for :inflow_items
end
