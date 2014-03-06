calendar_setup = ->
  if (calendar = $('[data-calendar]')).length > 0
    data = calendar.data('calendar')
    today = new Date(data.today)

    calendar.datepicker
      dateFormat: 'yy/mm/dd'
      defaultDate: data.default_date
      beforeShowDay: (date) ->
        has_event = $.inArray($.datepicker.formatDate('yy/mm/dd', date), data.scheduled_days) isnt -1
        can_read = if (date >= today or has_event) then true else false
        [ can_read, if has_event then 'has_event' else '' ]
      onSelect: (date, obj) ->
        url = window.location.pathname
        Turbolinks.visit(url.replace(url.match(/\d{4}\/\d{2}\/\d{2}/), date))
      onChangeMonthYear: (year, month, obj) ->
        url = window.location.pathname
        date = $.datepicker.formatDate('yy/mm/dd', new Date(year, month-1, 1))
        Turbolinks.visit(url.replace(url.match(/\d{4}\/\d{2}\/\d{2}/), date))

$(document).ready(calendar_setup)
$(document).on('page:load', calendar_setup)
