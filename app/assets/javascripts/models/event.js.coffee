#= require ./timeline

App.Event = App.Timeline.extend(
  location: DS.belongsTo('location', async: true)
  characters: DS.hasMany('character', async: true)
)
