$(document).on 'calendar-time-setup', '[data-calendar-time]', ->
  schedule = $(this).data('calendar-time')

  $(this).datetimepicker
    controlType: 'select'
    altField: '#schedule_scheduled_at'
    showButtonPanel: false
    altFieldTimeOnly: false
    showTime: false
    defaultDate: schedule.default_date
    hour: schedule.hour
    minute: schedule.min
    minDateTime: new Date(schedule.min_date_time)
