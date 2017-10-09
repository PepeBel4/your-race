class AddIndividualRecallToRaces < ActiveRecord::Migration[5.1]
  def change
  	add_column :races, :individual_recall, :boolean
  end
end
