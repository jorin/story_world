App.EventsNewController = Ember.ObjectController.extend(
  actions:
    submit: (event) ->
      location = @get "selected_location"
      characters = @get "selected_characters"
      event.set("location", location)
      event.get("characters").pushObjects characters
      self = @
      event.save().then ->
        location.get("events").pushObject event
        characters.forEach (character) ->
          character.get("events").pushObject event
        self.transitionToRoute "event", event
        return

    cancel: (event) ->
      event.rollback()
      @transitionToRoute "events"
      return

  available_characters: (->
        e_starts = @get("started_at")
        e_ends = @get("ended_at")
        if @get("is_valid_timeline")
          @get("all_characters").filter (character) ->
            e_starts >= character.get("started_at") and e_ends <= character.get("ended_at")
        else
          []
      ).property("started_at", "ended_at", "is_valid_timeline")

  character_selections: (->
        @get("available_characters").map((character) ->
          Ember.ObjectProxy.create(
            content: character
            selected: false
          )
        )
      ).property("available_characters")

  checked_character_selections: Ember.computed.filterBy("character_selections", "selected", true)
  selected_characters: Ember.computed.mapBy("checked_character_selections", "content")

  available_locations: (->
        e_starts = @get("started_at")
        e_ends = @get("ended_at")
        if @get("is_valid_timeline")
          @get("all_locations").filter (location) ->
            e_starts >= location.get("started_at") and e_ends <= location.get("ended_at")
        else
          []
      ).property("started_at", "ended_at", "is_valid_timeline")

  selected_location: null

  is_valid_timeline: (->
        e_starts = @get("started_at")
        e_ends = @get("ended_at")
        !Ember.isEmpty(e_starts) and !Ember.isEmpty(e_ends) and e_starts < e_ends
      ).property("started_at", "ended_at")

  is_incomplete_entry: (->
        !@get("is_valid_timeline") or Ember.isEmpty(@get("name")) or Ember.isEmpty(@get("description"))
      ).property("is_valid_timeline", "name", "description", "selected_characters", "selected_location")
)
