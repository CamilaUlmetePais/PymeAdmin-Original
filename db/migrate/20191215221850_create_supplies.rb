class CreateSupplies < ActiveRecord::Migration[5.0]
  def change
    create_table :table_supplies do |t|
    	t.string :name
    	t.float :price
    	t.string :unit
    	t.float :stock

    	t.timestamps
    end
  end
end
