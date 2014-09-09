class Removeindexs < ActiveRecord::Migration
  def change
    remove_index :skills, :column => [:name,:group_id]
    remove_index :groups, [:name, :organization_id]
    remove_index :people, [:name, :group_id]
  end
end
