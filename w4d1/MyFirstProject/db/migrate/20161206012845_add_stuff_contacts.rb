class AddStuffContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :name, :string, NULL: false
    add_column :contacts, :email, :text, NULL: false
    add_column :contacts, :user_id, :integer
    add_column :contacts, :created_at, :datetime
    add_column :contacts, :updated_at, :datetime
    add_index :contacts, [:user_id, :email], unique: true
  end
end
