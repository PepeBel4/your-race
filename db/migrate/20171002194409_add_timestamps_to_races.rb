class AddTimestampsToRaces < ActiveRecord::Migration[5.1]
  def change
  	add_column :races, :scheduled_for, :timestamp
  	add_column :races, :started_at, :timestamp
  	add_column :races, :finished_at, :timestamp
  	add_column :races, :canceled_at, :timestamp
  end
end
