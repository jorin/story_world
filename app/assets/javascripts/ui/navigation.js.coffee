$ ->
  $("body").delegate ".navbar-main a", "click", ->
    $(".navbar-main .navbar-collapse").collapse "hide"
