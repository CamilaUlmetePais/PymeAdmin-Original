class CreateInflows < ActiveRecord::Migration[5.0]
  def change
    create_table :inflows do |t|
      t.float :total

      t.timestamps
    end
  end
end
