class Inflow < ApplicationRecord
#	attr_accessible :total, :cash,
	has_many :inflow_items, dependent: :destroy
	validates :total, :cash, presence: true
end
