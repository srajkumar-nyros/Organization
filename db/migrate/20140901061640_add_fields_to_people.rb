class AddFieldsToPeople < ActiveRecord::Migration
  def change
    add_column :people, :group_id, :integer
    add_column :people, :skill_id, :integer
  end
end
