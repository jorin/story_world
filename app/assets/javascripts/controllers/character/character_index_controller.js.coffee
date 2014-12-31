App.CharacterIndexController = Ember.ObjectController.extend(actions:
  delete: (character) ->
    character.destroyRecord()
    @transitionToRoute "characters"
    return

  edit: (character) ->
    @transitionToRoute "character.edit"
    return
)
