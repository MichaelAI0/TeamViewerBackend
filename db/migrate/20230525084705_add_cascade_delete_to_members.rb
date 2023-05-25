class AddCascadeDeleteToMembers < ActiveRecord::Migration[7.0]
  def up
    # assuming your foreign key is named team_id and the table is named teams
    remove_foreign_key :members, column: :team_id
    add_foreign_key :members, :teams, column: :team_id, on_delete: :cascade
  end

  def down
    remove_foreign_key :members, :teams, column: :team_id
    add_foreign_key :members, :teams, column: :team_id
  end
end