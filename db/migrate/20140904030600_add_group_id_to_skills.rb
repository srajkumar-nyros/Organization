class AddGroupIdToSkills < ActiveRecord::Migration
  def change
    add_column :skills, :group_id, :integer
  end
end
