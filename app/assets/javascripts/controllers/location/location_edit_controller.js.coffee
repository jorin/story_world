App.LocationEditController = Ember.ObjectController.extend(actions:
  update: (location) ->
    location.save()
    @transitionToRoute "location", location
    return

  cancel: (location) ->
    location.rollback()
    @transitionToRoute "location", location
    return
)
