# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $("#task_description").focus()

  $(".glyphicon-ok-sign").hide()

  # Show Task Complete
  # showComplete = ->
  $(".glyphicon-exclamation-sign").click ->
    $("#ok-sign-" + $(".glyphicon-exclamation-sign").id()).show()
    $(".glyphicon-exclamation-sign").hide()