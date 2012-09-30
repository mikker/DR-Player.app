#= require jquery-1.8.2.min.js

window.cl = ->
  console.log(arguments) if console && console.log

$ ->
  $("#controls").on 'click', 'a', (e) ->
    e.preventDefault()
    $("a", $(this).parent()).removeClass("active")
    $(this).addClass("active")
    $("#player").attr("src", $(this).attr("href"))

resize = ->
  h = document.height - $("#controls").height()
  $("#player").css(height: "#{h}px");

$ ->
  resize()

window.onresize = resize
