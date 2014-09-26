class AddFieldsToTodos < ActiveRecord::Migration
  def change
    add_column :todos, :organization_id, :integer
    add_column :todos, :person_id, :integer
  end
end
