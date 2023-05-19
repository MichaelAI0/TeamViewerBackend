class UpdateMembersTable < ActiveRecord::Migration[7.0]
  def change
    remove_reference :members, :user, index: true, foreign_key: true
    add_column :members, :first_name, :string
    add_column :members, :last_name, :string
  end
end
