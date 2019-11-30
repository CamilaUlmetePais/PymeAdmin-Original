class OutflowItem < ApplicationRecord
# attr_accessible :quantity, :outflow_id, :product_id
  belongs_to :outflow
  belongs_to :product
end
