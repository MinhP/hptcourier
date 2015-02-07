# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ajax:success', 'a.purchase', (status,data,xhr) ->
  console.log(this.id)
  $a = $(this)
  $id = $a.id
  if $a.hasClass('purchase-true') 
    $a.attr('class', 'purchase purchase-false btn btn-sm btn-danger')
    console.log($a.firstChild)
    $a.html('<span class="glyphicon glyphicon-plus"/>')
  else
    $a.attr('class', 'purchase purchase-true btn btn-sm btn-primary')
    $a.html('<span class="glyphicon glyphicon-ok"/>')
  return
return