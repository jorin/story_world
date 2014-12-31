App.LocationIndexController = Ember.ObjectController.extend(actions:
  delete: (location) ->
    location.destroyRecord()
    @transitionToRoute "locations"
    return

  edit: (location) ->
    @transitionToRoute "location.edit"
    return
)
