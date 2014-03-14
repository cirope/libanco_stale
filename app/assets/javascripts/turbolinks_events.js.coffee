$(document).on 'page:fetch', -> $('.loading-caption').removeClass 'hidden'
$(document).on 'page:change', ->
  $('.loading-caption').addClass 'hidden'
  $('[autofocus]').focus()
