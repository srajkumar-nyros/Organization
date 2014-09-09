class Addindextoskills < ActiveRecord::Migration
  def change
    add_index :skills, [:name, :group_id], unique: true
  end
end
