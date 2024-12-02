class Renamecolumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :books, :type, :book_type
  end
end
