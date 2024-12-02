class AddUserIdToBooks < ActiveRecord::Migration[6.1]
  def change
    add_reference :books, :user, null: false, foreign_key: true
    remove_column :books, :author
  end
end
