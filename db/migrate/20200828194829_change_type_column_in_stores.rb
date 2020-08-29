class ChangeTypeColumnInStores < ActiveRecord::Migration[6.0]
  def change
    remove_column :stores, :type
    add_column :stores, :store_type, :string
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
