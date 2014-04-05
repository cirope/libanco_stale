jQuery ($) ->
  $('[autofocus]:first').focus()

  $(document).on 'click keypress', '[data-remove-target]', ->
    $($(this).data('removeTarget')).remove()

  $(document).on 'hidden.bs.modal', '#modal', ->
    $('#modal').remove()

  $(document).on 'shown.bs.modal', '#modal', ->
    $(this).find('[autofocus]').focus()
    $(this).find('[data-calculator-amount]').keyup()
