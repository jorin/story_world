class Character < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true
  validates :started_at, presence: true
  validates :ended_at, presence: true
end
