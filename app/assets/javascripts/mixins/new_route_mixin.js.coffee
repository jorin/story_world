App.NewRouteMixin = Ember.Mixin.create(
  deactivate: ->
    @get("controller.content").rollback()
)
