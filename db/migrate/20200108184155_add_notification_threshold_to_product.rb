class AddNotificationThresholdToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :notification_threshold, :integer
  end
end
