class CreateSpaces < ActiveRecord::Migration
  def change
    create_table :spaces do |t|
      t.string :name
      t.string :img
      t.boolean :is_rented, default: false
      t.integer :user_id

      t.timestamps
    end
  end
end
