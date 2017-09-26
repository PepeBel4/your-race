class CreateRaces < ActiveRecord::Migration[5.1]
  def change
    create_table :races do |t|
      t.string :name
      t.string :race_type
      t.integer :race_order
      t.boolean :final
      t.references :fleet, foreign_key: true
      t.timestamps
    end
  end
end
