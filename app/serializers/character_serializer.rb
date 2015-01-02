class CharacterSerializer < ApplicationSerializer
  embed :ids, include: true

  attributes :id, :name, :description, :started_at, :ended_at
  has_many :events, include: false
end

def include_events?
  object.association(:events).loaded?
end
