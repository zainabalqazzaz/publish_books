class AddDeviseToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :encrypted_password, :string
    add_column :users, :reset_password_token, :string
    add_column :users, :reset_password_sent_at, :datetime
    add_column :users, :remember_created_at, :datetime
  end
end
