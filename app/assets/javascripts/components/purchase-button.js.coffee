$(document).on 'ajax:success', 'a.purchase', (status,data,xhr) ->
  $a = $(this)
  if $a.hasClass('purchase-true') 
    $a.attr('class', 'purchase purchase-false btn btn-sm btn-danger')
    $a.attr('href', "/orderitems/#{this.id}?toggle=true")
    $a.html('<span class="glyphicon glyphicon-plus"/>')
  else
    $a.attr('class', 'purchase purchase-true btn btn-sm btn-primary')
    $a.attr('href', "/orderitems/#{this.id}?toggle=false")
    $a.html('<span class="glyphicon glyphicon-ok"/>')
  return
return