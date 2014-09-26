class FixColumnName < ActiveRecord::Migration
  def change
	rename_column :comments, :todos_id, :todo_id
  end
end
