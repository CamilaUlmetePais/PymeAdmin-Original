class Inflow < ApplicationRecord
	attr_accessor :cash, :inflow_items_attributes
	validates :total, :cash, presence: true
	has_many :inflow_items, dependent: :destroy, inverse_of: :inflow
	accepts_nested_attributes_for :inflow_items, allow_destroy: true
end
