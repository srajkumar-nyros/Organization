class Addindexs < ActiveRecord::Migration
  def change
      add_index :groups, [:name, :organization_id], unique: true
      add_index :people, [:name, :group_id], unique: true
  end
end
