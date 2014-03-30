jQuery ($) ->
  $('[autofocus]:first').focus()

  $(document).on 'click keypress', '[data-remove-target]', ->
    $($(this).data('removeTarget')).remove()

  $(document).on 'hidden.bs.modal', '#modal', ->
    $('#modal').remove()
