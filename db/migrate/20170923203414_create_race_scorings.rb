class CreateRaceScorings < ActiveRecord::Migration[5.1]
  def change
    create_table :race_scorings do |t|
      t.references :race_competitor, foreign_key: true
      t.references :race, foreign_key: true
      t.integer :position
      t.float :points
      t.string :comments

      t.timestamps
    end
  end
end
