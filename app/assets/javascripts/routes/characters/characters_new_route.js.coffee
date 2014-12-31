App.CharactersNewRoute = Ember.Route.extend(model: ->
  @store.createRecord "character"
)
