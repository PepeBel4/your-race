class RemoveMetricOrderFromMetrics < ActiveRecord::Migration[5.1]
  def change
  	remove_column :metrics, :metric_order
  end
end
