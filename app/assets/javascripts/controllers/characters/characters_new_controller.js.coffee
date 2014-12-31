App.CharactersNewController = Ember.ObjectController.extend(actions:
  submit: (character) ->
    character.save()
    @transitionToRoute "characters"
    return

  cancel: (character) ->
    character.rollback()
    @transitionToRoute "characters"
    return
)
