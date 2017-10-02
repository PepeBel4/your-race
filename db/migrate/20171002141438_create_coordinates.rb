class CreateCoordinates < ActiveRecord::Migration[5.1]
  def change
    create_table :coordinates do |t|
      t.timestamp :timestamp
      t.float :latitude
      t.float :longitude
      t.references :metric, foreign_key: true

      t.timestamps
    end
  end
end
