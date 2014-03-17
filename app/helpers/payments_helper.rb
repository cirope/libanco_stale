module PaymentsHelper
  def link_to_show_taxes(payment)
    content_tag :abbr, number_to_currency(payments_taxes_total(payment)),
      data: {
        toggle: 'popover', html: true, trigger: 'hover', placement: 'top',
        title: Tax.model_name.human(count: payment.taxes.size),
        content: render(partial: 'taxes/tax', locals: { payment: payment })
      }
  end

  def payments_taxes_total(payment)
    payment.taxes.map(&:value).reduce(:+) || 0
  end
end
