class ChangeUserColums < ActiveRecord::Migration
  def change
    remove_column :users, :name, :string
    remove_column :users, :email, :text
    add_column :users, :username, :string, :unique => true
  end
end
