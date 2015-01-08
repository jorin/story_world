App.LocationsNewRoute = Ember.Route.extend(App.NewRouteMixin, model: ->
  @store.createRecord "location"
)
