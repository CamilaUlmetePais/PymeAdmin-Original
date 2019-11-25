class CreateOutflows < ActiveRecord::Migration[5.0]
  def change
    create_table :outflows do |t|
      t.float :amount
      t.boolean :cash
      t.text :notes

      t.timestamps
    end
  end
end
