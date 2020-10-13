class AddExpensetyperefToSupply < ActiveRecord::Migration[5.0]
  def change
    add_column :supplies, :expense_type_id, :integer
  end
end
