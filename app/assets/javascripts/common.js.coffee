jQuery ($) ->
  $('[autofocus]:first').focus()

  $(document).on 'shown.bs.modal', '#modal', ->
    $(this).find('[autofocus]').focus()
    $(this).find('[data-calculator-amount]').keyup()

  $(document).on 'hidden.bs.modal', '#modal', ->
    $('#modal').remove()

  $(document).on 'click keypress', '[data-removeable]', ->
    $('[data-removeable]').remove()
    return false
