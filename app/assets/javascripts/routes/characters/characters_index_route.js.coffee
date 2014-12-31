App.CharactersIndexRoute = Ember.Route.extend(model: ->
  @store.find "character"
)
