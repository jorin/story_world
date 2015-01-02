App.CharacterIndexController = Ember.ObjectController.extend(
  actions:
    delete: (character) ->
      character.destroyRecord()
      @transitionToRoute "characters"
      return

    edit: (character) ->
      @transitionToRoute "character.edit"
      return

  has_events: (->
      @get("events").get("length") isnt 0
    ).property("events")
)
