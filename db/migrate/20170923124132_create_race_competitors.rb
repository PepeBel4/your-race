class CreateRaceCompetitors < ActiveRecord::Migration[5.1]
  def change
    create_table :race_competitors do |t|
      t.references :competitor, foreign_key: true
      t.references :race, foreign_key: true
      t.timestamps
    end
  end
end
