#= require ./timeline

App.EventsTimeline = App.Timeline.extend(
  events: DS.hasMany('event', async: true)
  ordered_events: (->
    Ember.ArrayProxy.createWithMixins(Ember.SortableMixin,
      sortProperties: ["started_at"]
      content: @get("events")
    )
  ).property("events")
  events_graph: (->
    start = @get("started_at")
    end = @get("ended_at")
    duration = end - start
    Ember.ArrayProxy.createWithMixins(Ember.SortableMixin,
      sortProperties: ["event.started_at"]
      content: DS.PromiseArray.create(
        promise: @get("events").then( (events) ->
          events.map( (e, i) ->
            e_start = e.get("started_at")
            e_end = e.get("ended_at")
            timeline_event = Ember.Object.create(
              positioning: "left: " + ((e_start - start)/duration * 100) + "%; width: " + ((e_end - e_start)/duration * 100) + "%;"
              event: e
            )
            timeline_event
          )
        )
      )
    )
  ).property("started_at", "ended_at", "events")
)
