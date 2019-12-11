class OutflowItem < ApplicationRecord
  belongs_to :outflow, optional: true
  belongs_to :product
end
