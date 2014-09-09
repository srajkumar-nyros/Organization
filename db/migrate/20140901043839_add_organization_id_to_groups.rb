class AddOrganizationIdToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :organization_id, :integer
  end
end
