class AddNotificationThresholdToSupplier < ActiveRecord::Migration[5.0]
  def change
    add_column :suppliers, :notification_threshold, :integer
  end
end
