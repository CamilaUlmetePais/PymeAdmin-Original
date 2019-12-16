class CreateSupplyProductLink < ActiveRecord::Migration[5.0]
  def change
    create_table :supply_product_links do |t|
			t.references :product, foreign_key: true
			t.references :supply, foreign_key: true
		end
  end
end
