#= require jquery-1.8.2.min.js

window.cl = ->
  console.log(arguments) if console && console.log

$ ->
  $("#channels").on 'click', 'a', (e) ->
    e.preventDefault()
    $("a", $(@).parent()).removeClass("active")
    $(@).addClass("active")
    $("#player").attr("src", $(@).attr("href"))

  $("a[href='#toggleBlinds']").on "click", (e) ->
    e.preventDefault()
    toggleBlinds()

window.toggleBlinds = () ->
  show = $(".blinds.top").css("top") == "-32px"
  destination = if show then "0" else "-32px"
  $(".blinds.top").css "top", "#{destination}"
  $(".blinds.bottom").css "bottom", "#{destination}"
  button = $("#blindsButton")
  if show then button.addClass("dimmed") else button.removeClass("dimmed")

resize = ->
  h = document.height - $("#controls").height()
  $("#player").css(height: "#{h}px")

$ ->
  resize()

window.onresize = resize
