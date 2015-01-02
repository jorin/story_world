App.EventSerializer = DS.ActiveModelSerializer.extend(DS.EmbeddedRecordsMixin,
  attrs:
    characters:
      serialize: "ids"
)
