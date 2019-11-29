class CreateOutflowItems < ActiveRecord::Migration[5.0]
  def change
    create_table :outflow_items do |t|
      t.float :quantity
      t.references :outflow, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
