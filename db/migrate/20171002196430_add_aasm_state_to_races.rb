class AddAasmStateToRaces < ActiveRecord::Migration[5.1]
  def change
    add_column :races, :aasm_state, :string
  end
end
