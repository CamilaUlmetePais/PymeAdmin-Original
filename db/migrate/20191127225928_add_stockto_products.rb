class AddStocktoProducts < ActiveRecord::Migration[5.0]
  def change
  	add_column :products, :stock, :float
  end
end
