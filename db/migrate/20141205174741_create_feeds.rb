class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.belongs_to :user
      t.string :message

      t.timestamps
    end
  end
end
