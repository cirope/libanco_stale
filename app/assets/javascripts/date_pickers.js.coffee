calendar = ->
  $('[data-calendar]').datepicker()

$(document).ready(calendar)
$(document).on('page:load', calendar)
