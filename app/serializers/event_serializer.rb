class EventSerializer < ApplicationSerializer
  embed :ids, include: true

  attributes :id, :name, :description, :started_at, :ended_at, :location_id
  has_many :characters, include: false
end

def include_characters?
  object.association(:characters).loaded?
end
