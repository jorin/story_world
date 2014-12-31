App.CharacterEditController = Ember.ObjectController.extend(actions:
  update: (character) ->
    character.save()
    @transitionToRoute "character", character
    return

  cancel: (character) ->
    character.rollback()
    @transitionToRoute "character", character
    return
)
