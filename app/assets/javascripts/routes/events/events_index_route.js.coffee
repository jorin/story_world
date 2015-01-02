App.EventsIndexRoute = Ember.Route.extend(model: ->
  @store.find "event"
)
