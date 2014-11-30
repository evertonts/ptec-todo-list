class List < ActiveRecord::Base
  has_many :tasks
  has_many :favorited, through: :favorites, source: :user
  has_many :favorites

  belongs_to :user

  validates :name, presence: true

  scope :open, -> { where(particular: false) }
end
