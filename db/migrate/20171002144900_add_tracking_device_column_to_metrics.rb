class AddTrackingDeviceColumnToMetrics < ActiveRecord::Migration[5.1]
  def change
  	add_column :metrics, :tracking_device, :string
  end
end
