App.PositionedInTimelineComponent = Ember.Component.extend(
  classNames: ['positioned-in-timeline']
  attributeBindings: ['style','promises']
  style: ''
  promises: (->
    self = @
    DS.PromiseObject.create(
      promise: Ember.RSVP.all([@get("in_started_at"),@get("timeline_started_at"),@get("in_ended_at"),@get("timeline_ended_at")]).then (times) ->
        timeline_length = times[3] - times[1]
        in_started_offset = times[0] - times[1]
        in_length = times[2] - times[0]
        self.set 'style', "margin-left: " + (in_started_offset/timeline_length)*100 + "%; width: " + (in_length/timeline_length)*100 + "%;"
    )
  ).property("in_started_at","timeline_started_at","in_ended_at","timeline_ended_at")
)
