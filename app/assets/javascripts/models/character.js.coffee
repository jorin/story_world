#= require ./timeline

App.Character = App.Timeline.extend(
  events: DS.hasMany('event', async: true)
)
