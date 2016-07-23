module Loans::Status
  extend ActiveSupport::Concern

  included do
    STATUS = ['current', 'canceled', 'history', 'expired', 'judicial']

    after_create :update_status
  end

  private

    def update_status
      customer.loans.canceled.each { |loan| loan.update_column(:status, 'history') }
    end
end
