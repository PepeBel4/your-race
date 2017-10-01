class AddColumnsToCompetitors < ActiveRecord::Migration[5.1]
  def change
    add_column :competitors, :sailor_id, :string
  end
end
