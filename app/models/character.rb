class Character < ActiveRecord::Base
  has_and_belongs_to_many :events

  validates :name, presence: true
  validates :description, presence: true
  validates :started_at, presence: true
  validates :ended_at, presence: true
end
