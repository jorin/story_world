App.LocationEditController = Ember.ObjectController.extend(
  actions:
    update: (location) ->
      location.save()
      @transitionToRoute "location", location
      return

    cancel: (location) ->
      location.rollback()
      @transitionToRoute "location", location
      return

  has_events: (->
      @get("events").get("length") isnt 0
    ).property("events")
)
