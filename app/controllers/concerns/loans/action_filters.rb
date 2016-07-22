module Loans::ActionFilters
  extend ActiveSupport::Concern

  included do
    Summary = Struct.new(:count, :amount, :new_count, :new_amount)

    before_action :set_loans, :set_new_loans, :set_summary, only: [:index]
  end

  private

    def set_loans
      @loans = params[:filter].present? ? loans_by_filter : loans_by_search
    end

    def set_new_loans
      @new_loans = @loans.select { |loan| !loan.customer.has_loan_active?(loan) }
    end

    def set_summary
      @summary = Summary.new @loans.size, @loans.sum('amount'),
        @new_loans.size, @new_loans.map(&:amount).sum
    end

    def loans_by_filter
      case params[:filter]
        when 'expired'         then Loan.expired
        when 'close_to_expire' then Loan.close_to_expire
        when 'not_renewed'     then Loan.not_renewed
      end
    end

    def loans_by_search
      start_date = params[:start_date] ? Timeliness.parse(params[:start_date])
        : Date.today.at_beginning_of_month
      end_date = params[:end_date] ? Timeliness.parse(params[:end_date])
        : Date.today.at_end_of_month

      Loan.search(start_date, end_date)
    end
end
