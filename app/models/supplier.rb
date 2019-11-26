class Supplier < ApplicationRecord
	has_many :outflows
	validates :name, presence: true
	validates :account_balance, numericality: { greater_than: 0 }
end
