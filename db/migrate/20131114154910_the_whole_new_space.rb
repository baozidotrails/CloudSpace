class TheWholeNewSpace < ActiveRecord::Migration
  def change
    drop_table :spaces

    create_table :spaces do |t|
      t.string :name
      t.string :map
      t.integer :user_id
      t.boolean :is_rented, default: false
      t.timestamps
    end
  end
end
