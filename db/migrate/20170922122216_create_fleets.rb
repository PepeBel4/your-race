class CreateFleets < ActiveRecord::Migration[5.1]
  def change
    create_table :fleets do |t|
      t.string :name
      t.string :fleet_type
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
