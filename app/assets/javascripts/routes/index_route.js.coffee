App.IndexRoute = Ember.Route.extend(
  setupController: (controller) ->
    characters = @store.find("character")
    locations = @store.find("location")
    events = @store.find("event")

    Ember.RSVP.all([characters, locations, events]).then (timelines_set) ->
      timelines = timelines_set[0].toArray().concat timelines_set[1].toArray().concat(timelines_set[2].toArray())
      all_started_at = undefined
      all_ended_at = undefined
      timelines.forEach (timeline) ->
        starts = timeline.get("started_at")
        ends = timeline.get("ended_at")
        all_started_at = starts if all_started_at is undefined or starts < all_started_at
        all_ended_at = ends if all_ended_at is undefined or ends > all_ended_at
      controller.set 'all_started_at', all_started_at
      controller.set 'all_ended_at', all_ended_at

    controller.set 'characters', characters 
    controller.set 'locations', locations
    controller.set 'events', events
)
