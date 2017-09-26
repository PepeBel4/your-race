class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.string :name
      t.references :competition, foreign_key: true

      t.timestamps
    end
  end
end
