jQuery ($) ->
  $(document).on 'change', '[data-customer-place-url]', ->
    $.getScript $(this).data 'customerPlaceUrl'
