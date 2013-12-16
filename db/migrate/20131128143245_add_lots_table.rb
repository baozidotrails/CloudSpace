class AddLotsTable < ActiveRecord::Migration
  def change
    create_table :lots do |t|
      t.string :name
      t.string :width
      t.string :height
      t.string :pos_x
      t.string :pos_y
      t.integer :space_id

      t.timestamps
    end
  end
end
