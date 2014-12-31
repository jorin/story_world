App.LocationsNewController = Ember.ObjectController.extend(actions:
  submit: (location) ->
    location.save()
    @transitionToRoute "locations"
    return

  cancel: (location) ->
    location.rollback()
    @transitionToRoute "locations"
    return
)
