class OutflowItem < ApplicationRecord
# attr_accessor :quantity, :outflow_id, :product_id
  belongs_to :outflow, optional: true
  belongs_to :product
end
