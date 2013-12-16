class RenameTableLot < ActiveRecord::Migration
  def change
    rename_table :lots, :loots
  end
end
