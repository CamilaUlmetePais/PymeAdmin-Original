class AddDetailsToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :chicken, :boolean
    add_column :products, :crate_percentage, :float
  end
end
