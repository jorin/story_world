App.CharactersNewRoute = Ember.Route.extend(App.NewRouteMixin, model: ->
  @store.createRecord "character"
)
