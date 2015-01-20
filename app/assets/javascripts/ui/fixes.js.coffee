$ ->
  $win = $(window)

  $("body").delegate ".events_timeline_event", "mouseenter", ->
    $detail = $(this).children ".events_timeline_detail"
    $detail.offset({left: 0, top: $detail.offset().top}) if $detail.offset().left < 0
    detail_right = $detail.outerWidth() + $detail.offset().left
    $detail.offset({left: $detail.offset().left - ($win.outerWidth() - detail_right), top: $detail.offset().top}) if detail_right > $win.outerWidth()

  $("body").delegate ".events_timeline_event", "mouseleave", ->
    $(this).children(".events_timeline_detail").removeAttr "style"
