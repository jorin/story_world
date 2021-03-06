#= require ./events_timeline

App.Character = App.EventsTimeline.extend(
  is_available_between: ((e_start, e_end) ->
    c_start = @get("started_at")
    c_end = @get("ended_at")
    return false if e_start < c_start or e_end > c_end
    available = true
    @get("events").forEach (e) ->
      c_e_start = e.get("started_at")
      c_e_end = e.get("ended_at")
      available = available and not (e_start >= c_e_start and e_start <= c_e_end) and not (e_end >= c_e_start and e_end <= c_e_end)
      available
    @set("marked_available", available)
    available
  )
)
