class ResetAllSchema < ActiveRecord::Migration
  def change
    drop_table :users

    create_table :users do |t|
      t.string :username
      t.string :account
      t.string :email
      t.string :password_digest
      t.string :remember_token
      t.boolean :is_god, default: false
    end
  end
end
