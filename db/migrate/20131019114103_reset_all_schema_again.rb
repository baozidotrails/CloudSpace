class ResetAllSchemaAgain < ActiveRecord::Migration
  def change
    drop_table :users

    create_table :users do |t|
      t.string :username
      t.string :account
      t.string :email
      t.string :password_digest
      t.string :remember_token
      t.boolean :is_god, default: false
      t.timestamps
    end

    add_index :users, :email
    add_index :users, :remember_token
  end
end
