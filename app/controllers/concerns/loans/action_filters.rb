module Loans::ActionFilters
  extend ActiveSupport::Concern

  included do
    Summary = Struct.new(:count, :amount)

    before_action :set_loans, :set_summary, only: [:index]
  end

  private

    def set_loans
      @loans = params[:filter].present? ? loans_by_filter : loans_by_search
    end

    def set_summary
      @summary = Summary.new(
        @loans.size, @loans.sum('amount')
      )
    end

    def loans_by_filter
      case params[:filter]
        when 'expired'         then Loan.expired
        when 'close_to_expire' then Loan.close_to_expire
        when 'not_renewed'     then Loan.not_renewed
      end
    end

    def loans_by_search
      params[:start_date] ||= l(Date.today.beginning_of_month)

      Loan.loans_search(
        start_date: params[:start_date], end_date: params[:end_date], limit: request.xhr?
      )
    end
end
