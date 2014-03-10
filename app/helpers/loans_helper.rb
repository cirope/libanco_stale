module LoansHelper
  def customer_label
    raw customer_text_label << ' ' << add_customer_link
  end

  def link_to_loan_info(*args)
    link_with_icon({ action: 'payments', icon: 'glyphicon glyphicon-info-sign' }, *args)
  end

  def menu_filter_for(filter = nil)
    options = params[:filter] == filter ? { class: 'active' } : ''

    content_tag :li, options do
      link_to t("menu.loans.#{(filter || 'title')}"), loans_path(filter: filter)
    end
  end

  def link_to_new_loan_schedule(loan)
    link_to(
      content_tag(:span, nil, class: 'glyphicon glyphicon-time'),
      new_loan_schedule_path(loan), data: { remote: true }
    )
  end

  def loan_progress_info(loan)
    progress = loan.progress

    progress_class = case progress
      when 0..50   then 'progress-bar-success'
      when 51..74  then 'progress-bar-info'
      when 75..89  then 'progress-bar-warning'
      when 90..100 then 'progress-bar-danger'
    end

    content_tag(:div, class: 'progress') do
      content_tag(:div, "#{progress}%", class: "progress-bar #{progress_class}", style: "width: #{progress}%;")
    end
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
