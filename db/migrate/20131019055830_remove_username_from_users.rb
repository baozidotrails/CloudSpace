class RemoveUsernameFromUsers < ActiveRecord::Migration
  def change
    drop_table :users

    create_table :users do |t|
      t.string :username
      t.string :account
      t.string :email

      t.timestamps
    end
  end
end
