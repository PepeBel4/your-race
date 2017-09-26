class CreateFinishes < ActiveRecord::Migration[5.1]
  def change
    create_table :finishes do |t|
      t.references :race_competitor, foreign_key: true
      t.references :metric, foreign_key: true
      t.timestamp :timestamp
      t.integer :position

      t.timestamps
    end
  end
end
