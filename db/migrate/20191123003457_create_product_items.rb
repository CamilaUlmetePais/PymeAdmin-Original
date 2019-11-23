class CreateProductItems < ActiveRecord::Migration[5.0]
  def change
    create_table :product_items do |t|
      t.float :quantity

      t.timestamps
    end
  end
end
