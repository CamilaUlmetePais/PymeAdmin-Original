class Outflow < ApplicationRecord
	has_many :outflow_items, dependent: :destroy
	belongs_to :supplier
	alias_attribute :items, :outflow_items
	accepts_nested_attributes_for :outflow_items, allow_destroy: true, reject_if: :all_blank
	validates :total, :paid, :supplier_id, presence: true
	validates :total, numericality: { greater_than: 0 }

	def balance
		self.paid - self.total
	end

	def generate_total
		self.total = 0
		self.items.each do |item|
			self.total += item.subtotal
		end
	end

	def restore_stock
		self.update_stock(false)
	end

	def add_stock
		self.update_stock(true)
	end

	def update_stock(add)
		self.items.each do |item|
			if add && !item.quantity.nil?
				value = item.quantity
			else
				value = -item.quantity
			end
			item.supply.update_stock(value)
		end
	end

	def update_stocks
		self.items.each do |item|
			link_update(item)
		end
	end

	def link_update(outflow_item)
		link = SupplyProductLink.find_by(supply_id: item.supply.id)
		if link.nil?
			item.supply.update_stock(item.quantity)
		else
			Product.find(link.product_id).update_stock(item.quantity)
		end
	end

end
