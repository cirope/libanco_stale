calendar_setup = ->
  if (calendar = $('[data-calendar]')).length > 0
    data = calendar.data('calendar')
    today = new Date(data.today)

    calendar.datepicker
      dateFormat: "yy/mm/dd"
      defaultDate: data.default_date
      beforeShowDay: (date) ->
        has_event = $.inArray($.datepicker.formatDate('yy/mm/dd', date), data.scheduled_days) isnt -1
        can_read = if (date >= today or has_event) then true else false
        [ can_read, if has_event then 'has_event' else '' ]
      onSelect: (date, obj) ->
        pathname = window.location.pathname.split('/')[1]
        window.location.pathname = pathname + "/" + date
      onChangeMonthYear: (year, month, obj) ->
        pathname = window.location.pathname.split('/')[1]
        date = $.datepicker.formatDate('yy/mm/dd', new Date(year, month-1, 1))
        window.location.pathname = pathname + "/" + date

$(document).ready(calendar_setup)
$(document).on('page:load', calendar_setup)
