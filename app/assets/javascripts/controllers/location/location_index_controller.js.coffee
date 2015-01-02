App.LocationIndexController = Ember.ObjectController.extend(
  actions:
    delete: (location) ->
      location.destroyRecord()
      @transitionToRoute "locations"
      return

    edit: (location) ->
      @transitionToRoute "location.edit"
      return

  has_events: (->
      @get("events").get("length") isnt 0
    ).property("events")
)
