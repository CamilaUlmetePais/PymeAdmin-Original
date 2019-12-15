class RenameAmountFromOutflow < ActiveRecord::Migration[5.0]
  def change
  	rename_column :outflows, :amount, :total
  end
end
