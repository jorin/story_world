App.Router.map ()->
  @resource "characters", ->
    @route "new"
    @resource "character",  path: ":character_id", ->
      @route "edit"
  @resource "locations", ->
    @route "new"
    @resource "location",  path: ":location_id", ->
      @route "edit"
  @resource "events", ->
    @route "new"
    @resource "event", path: ":event_id"
