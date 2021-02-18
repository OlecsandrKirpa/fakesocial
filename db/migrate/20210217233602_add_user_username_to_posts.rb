class AddUserUsernameToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :user_username, :string
    add_index :posts, :user_username
  end
end
