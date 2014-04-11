module Loans::CustomerScoped
  extend ActiveSupport::Concern

  included do
    before_action :set_customer, only: [:new, :create, :show]
  end

  private

    def set_customer
      @customer = Customer.find(params[:customer_id])
    end
end
