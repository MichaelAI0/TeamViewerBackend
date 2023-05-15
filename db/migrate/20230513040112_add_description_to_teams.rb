class AddDescriptionToTeams < ActiveRecord::Migration[7.0]
  def change
    add_column :teams, :description, :text
  end
end
