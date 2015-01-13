$ ->
  $("body").delegate ".navbar .navbar-collapse a", "click", ->
    $(".navbar .navbar-collapse").collapse "hide"
