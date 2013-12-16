class CreateLots < ActiveRecord::Migration
  def change
    create_table :lots do |t|
      t.string :name
      t.string :width
      t.string :height
      t.string :pos_left
      t.string :pos_top
      t.integer :space_id
      t.integer :user_id

      t.timestamps
    end
  end
end
