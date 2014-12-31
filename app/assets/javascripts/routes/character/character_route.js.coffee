App.CharacterRoute = Ember.Route.extend(model: (params) ->
  @store.find "character", params.character_id
)
