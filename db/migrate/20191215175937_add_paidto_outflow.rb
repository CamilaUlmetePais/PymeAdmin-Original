class AddPaidtoOutflow < ActiveRecord::Migration[5.0]
  def change
  	add_column :outflows, :paid, :float
  end
end
