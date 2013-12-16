class Rebirth < ActiveRecord::Migration
  def change
    drop_table :spaces
    create_table :spaces do |t|
      t.string :name
      t.string :img
      t.string :width
      t.string :height
      t.string :pos_left
      t.string :pos_top
      t.boolean :is_rented, default: false
      t.integer :user_id

      t.timestamps
    end
  end
end