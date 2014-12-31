App.LocationsNewRoute = Ember.Route.extend(model: ->
  @store.createRecord "location"
)
