class DropLots < ActiveRecord::Migration
  def change
    drop_table :lots
    drop_table :spaces
  end
end
