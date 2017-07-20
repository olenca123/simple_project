class AddAdminToSignups < ActiveRecord::Migration[5.1]
  def change
    add_column :signups, :admin, :boolean, default: false
  end
end
