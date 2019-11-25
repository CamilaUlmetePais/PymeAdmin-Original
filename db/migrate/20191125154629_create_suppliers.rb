class CreateSuppliers < ActiveRecord::Migration[5.0]
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :phone_number
      t.float :account_balance

      t.timestamps
    end
  end
end
