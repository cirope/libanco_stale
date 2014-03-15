isScrolledIntoView = (elem) ->
  docViewTop = $(window).scrollTop()
  docViewBottom = docViewTop + $(window).height()

  elemTop = $(elem).offset().top
  elemBottom = elemTop + $(elem).height()

  ((elemBottom <= docViewBottom) && (elemTop >= docViewTop))

endless_pagination = ->
  if $('[data-endless-container]').length
    $(window).on 'scroll touchmove', ->
      visible = $('.pagination-container').is(':visible')
      url = $('.pagination .next_page').attr('href')
      atBottom = $(window).scrollTop() > $(document).height() - $(window).height() - 150

      if url and visible and (atBottom or isScrolledIntoView('.pagination-container'))
        $('.pagination-container').html(
          $('<div class="alert alert-warning"></div>').html($('.loading-caption').html())
        )
        $.getScript(url)

    $(window).scroll()

$(document).ready(endless_pagination)
$(document).on('page:load', endless_pagination)
