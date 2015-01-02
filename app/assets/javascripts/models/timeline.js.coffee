App.Timeline = DS.Model.extend(
  name: DS.attr("string")
  description: DS.attr("string")
  started_at: DS.attr("number")
  ended_at: DS.attr("number")
  is_valid_timeline: (->
        e_starts = parseFloat @get("started_at")
        e_ends = parseFloat @get("ended_at")
        !Ember.isEmpty(e_starts) and !Ember.isEmpty(e_ends) and e_starts < e_ends
      ).property("started_at", "ended_at")
  is_valid: (->
        @get("is_valid_timeline") and !Ember.isEmpty(@get("name")) and !Ember.isEmpty(@get("description"))
      ).property("name","description","is_valid_timeline")
  is_invalid: (->
        !@get("is_valid")
      ).property("is_valid")
)
