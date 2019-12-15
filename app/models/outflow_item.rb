class OutflowItem < ApplicationRecord
  belongs_to :outflow, optional: true
  belongs_to :supply

  def list
		self.supply.name + " " + self.quantity.to_s + " / "
	end
end
