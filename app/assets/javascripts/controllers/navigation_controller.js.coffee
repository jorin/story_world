App.NavigationController = Ember.ObjectController.extend(
  characters: (->
    @store.find("character")
  ).property("store")
  locations: (->
    @store.find("location")
  ).property("store")
  sw_events: (->
    @store.find("event")
  ).property("store")
)
