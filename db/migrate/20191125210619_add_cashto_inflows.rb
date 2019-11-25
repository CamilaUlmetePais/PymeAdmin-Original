class AddCashtoInflows < ActiveRecord::Migration[5.0]
  def change
    add_column :inflows, :cash, :boolean
  end
end
