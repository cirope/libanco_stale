$(document).on 'focus', '[data-date-picker]:not(.hasDatepicker)', ->
  $(this).datepicker()
