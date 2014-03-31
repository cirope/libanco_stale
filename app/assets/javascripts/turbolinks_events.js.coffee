$(document).on 'page:fetch', -> $('.loading-caption').removeClass 'hidden'
$(document).on 'page:load', ->
  $('.loading-caption').addClass 'hidden'
  $('[autofocus]').focus()
