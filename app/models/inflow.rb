class Inflow < ApplicationRecord
	has_many :inflow_items, dependent: :destroy
	validates :total, :cash, presence: true
end
