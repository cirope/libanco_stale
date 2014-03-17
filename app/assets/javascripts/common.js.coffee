@Main =
  load: ->
    $('[autofocus]:first').focus()
    $('[data-toggle="popover"]').popover()

jQuery ($) ->
  Main.load()

  $(document).on 'click keypress', '[data-remove-target]', ->
    $($(this).data('removeTarget')).remove()
