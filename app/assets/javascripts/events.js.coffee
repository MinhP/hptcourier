# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ajax:success', '.btn-eventer', (status,data,xhr) ->
  btn = $(this)
  if data.event_status == 'going'
    user_id = data.user_id
    $("#eventer-going").addClass("hidden")
    $("#eventer-notgoing").removeClass("hidden")
    $.ajax
      url: "/users/" + data.user_id + "/usericon"
      dataType: "html"
      success: (data, status, xhr) ->
        $("#eventers-list").append("<li id='eventer-"+user_id+"'>"+data+"</li>")
  else
    $("#eventer-going").removeClass("hidden")
    $("#eventer-notgoing").addClass("hidden")
    $("#eventer-"+data.user_id).remove()
