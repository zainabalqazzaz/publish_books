class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :description
      t.string :author
      t.integer :pages
      t.string :type
      t.string :author_country
    
      

      t.timestamps
    end
  end
end
