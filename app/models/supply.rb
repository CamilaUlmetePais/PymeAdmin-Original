class Supply < ApplicationRecord
	has_many :outflow_items
	alias_attribute :items, :outflow_items
	validates :name, :price, :unit, :stock, presence: true
	validates :price, numericality: { greater_than: 0 }
end