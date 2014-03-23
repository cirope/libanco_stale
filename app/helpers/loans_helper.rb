module LoansHelper
  def customer_label
    raw customer_text_label << ' ' << add_customer_link
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

    render(
      partial: 'loans/progress',
      locals: { loan: loan, progress: progress, progress_class: progress_class },
      formats: [:html]
    )
  end

  def loan_delayed_at_info(loan)
    t(
      'datetime.distance_in_words.x_days',
      count: (Date.today - loan.next_payment_expire_at).to_i
    )
  end

  def show_filter_column
    case params[:filter]
      when 'expired'
        content_tag(:th, Loan.human_attribute_name(:delayed_at))
      when 'close_to_expire'
        content_tag(:th, Loan.human_attribute_name(:progress))
      when 'not_renewed'
        content_tag(:th, Loan.human_attribute_name(:canceled_at))
    end
  end

  def show_filter_row(loan)
    case params[:filter]
      when 'expired'
        content_tag(:td, loan_delayed_at_info(loan))
      when 'close_to_expire'
        content_tag(:td, loan_progress_info(loan))
      when 'not_renewed'
        content_tag(:td, l(loan.canceled_at))
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
