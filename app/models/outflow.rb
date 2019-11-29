class Outflow < ApplicationRecord
	belongs_to :supplier
	has_many :outflow_items, dependent: :destroy
	validates :amount, :cash, :supplier_id, presence: true
	validates :amount, numericality: { greater_than: 0 }
end
