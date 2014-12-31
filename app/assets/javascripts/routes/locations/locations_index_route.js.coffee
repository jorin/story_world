App.LocationsIndexRoute = Ember.Route.extend(model: ->
  @store.find "location"
)
