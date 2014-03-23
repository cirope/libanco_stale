jQuery ($) ->
  $(document).on 'show.bs.tab', '[data-lazy-tabs]', (event) ->
    tab = $(event.target)
    url = tab.data('remoteUrl')

    if url
      tabID = tab.attr('href')

      unless $(tabID).data('loaded')
        $(tabID).data 'loaded', true
        $.getScript url
