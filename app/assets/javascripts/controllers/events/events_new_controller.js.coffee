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

  is_incomplete_entry: (->
        window.loc = @get("selected_location")
        window.chars = @get("selected_characters")
        @get("is_invalid") or @get("selected_characters").length is 0 or @get("selected_location") is null
      ).property("is_invalid", "selected_characters", "selected_location")
)
