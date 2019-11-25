class RemoveQuantityfromProducts < ActiveRecord::Migration[5.0]
  def up
    remove_column :products, :quantity
  end

  def down
    add_column :products, :quantity, :float
  end
 end
