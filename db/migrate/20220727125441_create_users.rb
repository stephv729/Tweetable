class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      # t.string :email
      # t.string :password
      t.string :username, null: false
      t.string :name, null: false

      t.timestamps
    end
    add_index :users, :username, unique: true
    #Ex:- add_index("admin_users", "username")
  end
end
