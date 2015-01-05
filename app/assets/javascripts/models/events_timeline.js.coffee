#= require ./timeline

App.EventsTimeline = App.Timeline.extend(
  events: DS.hasMany('event', async: true)
  ordered_events: (->
    Ember.ArrayProxy.createWithMixins(Ember.SortableMixin,
      sortProperties: ["started_at"]
      content: @get("events")
    )
  ).property("events")
)
