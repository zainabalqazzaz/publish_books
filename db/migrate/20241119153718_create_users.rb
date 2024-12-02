class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t| 
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :gender
      t.datetime :dob
      t.integer :age
      t.integer :ssn
      t.string :linkedin_profil
      t.string :adress
      

      t.timestamps
    end
  end
end
