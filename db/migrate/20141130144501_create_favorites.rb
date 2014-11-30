class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites, id: false do |t|
      t.belongs_to :user
      t.belongs_to :list
    end
  end
end
