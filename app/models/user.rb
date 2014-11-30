class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :validatable

  has_many :lists
  has_many :favorite_lists, through: :favorites, source: :list
  has_many :favorites
end
