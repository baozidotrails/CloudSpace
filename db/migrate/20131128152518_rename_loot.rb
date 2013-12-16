class RenameLoot < ActiveRecord::Migration
  def change
    rename_table :loots, :lots
  end
end
