module Loans::ActionFilters
  extend ActiveSupport::Concern

  included do
    before_action :load_loans, only: [:index]
  end

  private

    def load_loans
      @loans = case params[:filter]
        when 'expired'
          Loan.expired
        when 'close_to_expire'
          Loan.close_to_expire
        when 'not_renewed'
          Loan.not_renewed
        else
          Loan.current
        end
    end
end
