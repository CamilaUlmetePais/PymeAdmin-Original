class Outflow < ApplicationRecord
#	attr_accessor :amount, :cash, :notes, :supplier_id
	belongs_to :supplier
	has_many :outflow_items, dependent: :destroy
	validates :amount, :cash, :supplier_id, presence: true
	validates :amount, numericality: { greater_than: 0 }
	accepts_nested_attributes_for :outflow_items, allow_destroy: true
end
