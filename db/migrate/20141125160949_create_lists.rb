class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.boolean :particular, default: false, null: false
      t.string :name
      t.timestamps
    end
  end
end
