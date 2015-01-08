App.EventsNewRoute = Ember.Route.extend(App.NewRouteMixin, model: ->
  new_event = @store.createRecord "event"
  new_event.set("all_characters", @store.find("character"))
  new_event.set("all_locations", @store.find("location"))
  new_event
)
