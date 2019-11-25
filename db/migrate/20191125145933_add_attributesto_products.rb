class AddAttributestoProducts < ActiveRecord::Migration[5.0]
  def change
  	add_column :products, :unit, :string
  	add_column :products, :promotion_price, :float
  end
end
