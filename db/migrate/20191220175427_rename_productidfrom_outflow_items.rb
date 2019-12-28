class RenameProductidfromOutflowItems < ActiveRecord::Migration[5.0]
  def change
  	rename_column :outflow_items, :product_id, :supply_id
  end
end
