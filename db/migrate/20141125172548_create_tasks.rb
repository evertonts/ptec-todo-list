class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.belongs_to :list
      t.string :description

      t.timestamps
    end
  end
end
