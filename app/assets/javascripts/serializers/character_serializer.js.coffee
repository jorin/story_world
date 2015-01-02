App.CharacterSerializer = DS.ActiveModelSerializer.extend(DS.EmbeddedRecordsMixin,
  attrs:
    events:
      serialize: "ids"
)
