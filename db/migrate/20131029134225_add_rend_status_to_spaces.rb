class AddRendStatusToSpaces < ActiveRecord::Migration
  def change
    add_column :spaces, :isrented, :boolean, default: false
  end
end
