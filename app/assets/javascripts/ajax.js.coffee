$(document)
  .ajaxStart ->
    $('.loading-caption').removeClass 'hidden'
  .ajaxStop ->
    $('.loading-caption').addClass 'hidden'
