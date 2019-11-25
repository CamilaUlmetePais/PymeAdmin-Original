class AddReferenceIdsToProductItem < ActiveRecord::Migration[5.0]
  def change
  	add_reference :product_items, :product
  	add_reference :product_items, :inflow
  end
end
