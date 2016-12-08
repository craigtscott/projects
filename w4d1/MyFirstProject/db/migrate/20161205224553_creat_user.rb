class CreatUser < ActiveRecord::Migration
  def change
    create_table :user do |t|
      t.string :name, NULL: false
      t.text :email, NULL: false

      t.timestamps
    end
  end
end
