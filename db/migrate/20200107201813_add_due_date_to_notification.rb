class AddDueDateToNotification < ActiveRecord::Migration[5.0]
  def change
    add_column :notifications, :due_date, :datetime
  end
end
