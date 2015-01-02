class LocationSerializer < ApplicationSerializer
  embed :ids, include: true

  attributes :id, :name, :description, :started_at, :ended_at
  has_many :events
end
