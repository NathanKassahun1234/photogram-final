class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :encrypted_password
      t.boolean :private
      t.integer :comments_count
      t.integer :likes_count
      t.datetime :remember_created_at
      t.datetime :reset_password_sent_at
      t.string :reset_password_token

      t.timestamps
    end
    add_index :users, :username, unique: true
    add_index :users, :email, unique: true
  end
end
