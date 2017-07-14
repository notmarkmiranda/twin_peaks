class AddAndDropColumnOnUsersTable < ActiveRecord::Migration[5.1]
  def up
    add_column :users, :login, :string
    remove_column :users, :user_id
  end

  def down
    remove_column :users, :login
    add_column :users, :user_id, :string
  end
end
