class AddTypeToNotifications < ActiveRecord::Migration[5.0]
  def change
    add_column :notifications, :type, :string
  end
end
