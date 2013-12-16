class ChangeUsernamePositionFromUsers < ActiveRecord::Migration
  def change
    change_column :users, :username, :string, after: :account
  end
end
