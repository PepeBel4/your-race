class CreateDeviceCoordinates < ActiveRecord::Migration[5.1]
  def change
    create_table :device_coordinates do |t|
      t.string :device_id
      t.timestamp :timestamp
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
