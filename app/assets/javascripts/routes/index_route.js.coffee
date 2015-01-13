App.IndexRoute = Ember.Route.extend(
  setupController: (controller) ->
    controller.set 'characters', @store.find("character") 
    controller.set 'locations', @store.find("location")
    controller.set 'events', @store.find("event")
)
