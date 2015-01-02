App.Timeline = DS.Model.extend(
  name: DS.attr("string")
  description: DS.attr("string")
  started_at: DS.attr("number")
  ended_at: DS.attr("number")
)
