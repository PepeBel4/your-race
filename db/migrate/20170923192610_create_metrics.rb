class CreateMetrics < ActiveRecord::Migration[5.1]
  def change
    create_table :metrics do |t|
      t.string :name
      t.integer :metric_order
      t.string :metric_type
      t.references :race, foreign_key: true

      t.timestamps
    end
  end
end
