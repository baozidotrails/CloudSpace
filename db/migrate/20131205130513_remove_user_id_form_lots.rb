class RemoveUserIdFormLots < ActiveRecord::Migration
  def change
    remove_column :lots, :user_id
  end
end
