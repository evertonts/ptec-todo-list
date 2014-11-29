class List < ActiveRecord::Base
  has_many :tasks
  belongs_to :user

  validates :name, presence: true

  scope :open, -> { where(particular: false) }
end
