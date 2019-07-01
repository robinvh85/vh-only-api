class AddAuthorizationTokenToUserDevises < ActiveRecord::Migration[5.2]
  def change
    add_column :user_devises, :authentication_token, :string, limit: 30
    add_index :user_devises, :authentication_token, unique: true
  end
end
