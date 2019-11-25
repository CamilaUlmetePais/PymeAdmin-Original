class AddReferenceIdsToOutflow < ActiveRecord::Migration[5.0]
  def change
  	add_reference :outflows, :supplier
  end
end
