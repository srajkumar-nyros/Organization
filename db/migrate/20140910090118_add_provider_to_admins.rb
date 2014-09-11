class AddProviderToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :provider, :string
    add_column :admins, :adminid, :string
  end
end
