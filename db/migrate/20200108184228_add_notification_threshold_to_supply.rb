class AddNotificationThresholdToSupply < ActiveRecord::Migration[5.0]
  def change
    add_column :supplies, :notification_threshold, :integer
  end
end
