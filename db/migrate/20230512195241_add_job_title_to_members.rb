class AddJobTitleToMembers < ActiveRecord::Migration[7.0]
  def change
    add_column :members, :job_title, :string
  end
end
