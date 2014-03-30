jQuery ($) ->
  $(document).on 'change', '[data-rate-set-url]', ->
    if (rateSetId = $(this).val())
      url = $(this).data('rateSetUrl').replace('rate_set_id', rateSetId)
      $.getScript url
    else
      $('[data-update-payments-count] option:not(:first)').remove()
      $('[data-simulator-place-holder]').html('')
