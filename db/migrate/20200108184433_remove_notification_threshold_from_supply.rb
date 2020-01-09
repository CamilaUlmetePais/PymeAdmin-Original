class RemoveNotificationThresholdFromSupply < ActiveRecord::Migration[5.0]
  def change
  	remove_column :supplies, :notification_threshold, :integer
  end
end
