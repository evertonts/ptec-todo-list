class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :validatable

  has_many :lists
  has_many :favorite_lists, through: :favorites, source: :list
  has_many :favorites
  has_many :feeds

  def add_favorite(list)
    favorite_lists.push(list)
    save
  end

  def remove_favorite(list)
    favorite_lists.delete(list)
    save
  end
end
