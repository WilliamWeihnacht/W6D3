class UpdateUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :name
    rename_column :users, :email, :username 
    change_column :users, :username, :string, unique: true
  end
end
