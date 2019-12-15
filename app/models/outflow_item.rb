class OutflowItem < ApplicationRecord
  belongs_to :outflow, optional: true
  belongs_to :product

  def list
		self.product.name + " " + self.quantity.to_s + " / "
	end
end
