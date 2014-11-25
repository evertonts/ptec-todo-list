class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.belongs_to :list
      t.text :description

      t.timestamps
    end
  end
end
