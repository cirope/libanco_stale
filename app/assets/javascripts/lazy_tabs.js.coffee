jQuery ($) ->
  $(document).on 'show.bs.tab', '[data-lazy-tabs]', (event) ->
    tab = $(event.target)
    loaded = tab.data('loaded')

    unless loaded
      $(tab).data 'loaded', true
      $.getScript tab.data('remoteUrl')
