class AddReferenceIdsToInflowItem < ActiveRecord::Migration[5.0]
  def change
  	add_reference :inflow_items, :product
  	add_reference :inflow_items, :inflow
  end
end
