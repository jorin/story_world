#= require ./timeline

App.Location = App.Timeline.extend(
  events: DS.hasMany("event", async: true)
)
