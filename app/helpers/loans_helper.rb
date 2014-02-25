module LoansHelper
  def customer_label
    raw customer_text_label << ' ' << add_customer_link
  end

  def link_to_show_payments(*args)
    link_with_icon({ action: 'payments', icon: 'glyphicon-th' }, *args)
  end

  private

    def customer_text_label
      Loan.human_attribute_name 'customer'
    end

    def add_customer_link
      link_to new_customer_path, title: t('loans.new.customer'), data: { remote: true } do
        content_tag :span, nil, class: 'glyphicon glyphicon-plus-sign'
      end
    end
end
