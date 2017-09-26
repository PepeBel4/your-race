class CreateCompetitors < ActiveRecord::Migration[5.1]
  def change
    create_table :competitors do |t|
      
      t.string :number
      t.string :name
      t.string :email
      t.string :country

      t.references :group, foreign_key: true
      
      t.timestamps
    end
  end
end
