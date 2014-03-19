class Calculator
  constructor: (@element) ->
    @amount = @element.val()
    @paymentsData = $('[data-payments-data]').data('paymentsData')

    @_calculate() if @_valid

  _render: (paymentsCount, value) ->
    $("[data-calculator-#{paymentsCount}]").text(
      @_number_to_currency value
    )

  _valid: ->
    jQuery.isNumeric(@amount)

  _calculate: ->
    jQuery.map @paymentsData, (interest, paymentsCount) =>
      result = (@amount * interest) / paymentsCount
      @_render paymentsCount, result

  _number_to_currency: (number, precision = 2) ->
    n = number.toFixed(precision).toString().split '.'
    n[0] = n[0].replace(/\B(?=(\d{3})+(?!\d))/g, '.')
    "$#{n.join(',')}"

jQuery ($) ->
  $(document).on 'keyup', '[data-calculator-amount]', -> new Calculator $(this)
