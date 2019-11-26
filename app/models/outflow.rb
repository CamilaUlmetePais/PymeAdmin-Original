class Outflow < ApplicationRecord
	belongs_to :supplier
	validates :amount, :cash, :supplier_id, presence: true
	validates :amount, numericality: { greater_than: 0 }
end
