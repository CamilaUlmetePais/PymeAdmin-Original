class Outflow < ApplicationRecord
	alias_attribute :items, :outflow_items
	belongs_to :supplier
	has_many :outflow_items, dependent: :destroy
	validates :total, :paid, :supplier_id, presence: true
	validates :total, numericality: { greater_than: 0 }
	accepts_nested_attributes_for :outflow_items, allow_destroy: true

	def balance
		self.paid - self.total
	end

	def generate_total
		total = 0
		self.items.each do |item|
			total += item.subtotal
		end
		total
	end

	def update_stocks
		self.items.each do |item|
			link = SupplyProductLink.find_by(supply_id: item.supply.id)

			if link.nil?
				item.supply.update_stock(item.quantity)
			else
				Product.find(link.product_id).update_stock(item.quantity)
			end
		end
	end

end
