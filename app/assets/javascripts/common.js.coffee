jQuery ($) ->
  $('[data-toggle="tooltip"]').tooltip()
  $('[autofocus]:first').focus()

  $(document).on 'click keypress', '[data-remove-target]', ->
    $($(this).data('removeTarget')).remove()
