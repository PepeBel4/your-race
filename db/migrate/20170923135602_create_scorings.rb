class CreateScorings < ActiveRecord::Migration[5.1]
  def change
    create_table :scorings do |t|
      t.float :points
      t.float :discards
      t.float :points_with_discards
      t.integer 'race_positions', array: true, default: []
      t.float 'race_points', array: true, default: []
      t.string 'race_comments', array: true, default: []
      t.references :group, foreign_key: true
      t.references :competitor, foreign_key: true

      t.timestamps
    end
  end
end
